Crafty.defineScene('Battle', function(properties) {
    Game.turn = 'player';
    Crafty.background('#4A4');
    Crafty.e('StatusBar').show('The battle begins!');
    Crafty.e('Player');

    var n = randomBetween(2, 4);
    for (var i = 0; i < n; i++) {
        var e = Crafty.e(properties.name).color(properties.color).move(400 + 64 * i, 64 + 32 * i);
        e.colour = properties.color;
    }

    if (config('enable_combos') == true) {
        Crafty.e('Button').move(25, 300).color('#ffffaa').button('S');
        Crafty.e('Button').move(100, 300).color('#ffff66').button('M');
        Crafty.e('Button').move(175, 300).color('#ffff00').button('L');    
        Crafty.e('Actor, Text2, ComboText').move(350, 300).text('Combo: 0')
    } else {
        var attackButton = Crafty.e('Button').move(100, 300).color('#ffff66')
        .button('Attack', function() {
            if (Crafty("Player").target != null) {
                attackButton.visible = false;
            }
        });
    }
    Crafty.e('TimingBar');
});

Game.endPlayerTurn = function() {
    var self = this;
    this.turn = 'enemy';
    var player = Crafty('Player');

    if (config("enable_combos") == true) {
        player.queue = [];
        player.updateComboText();
    }
    
    self.hideUi();

    Crafty.wait(1, function() {
        // Wait before any attacks
        Crafty('StatusBar').show('Monsters turn!');
        Crafty.wait(1, function() {
            Crafty.forEach('Enemy', function(enemy, i) {
                // A hack, wrapped in a kludge, wrapped in a delicious pastry shell ...
                // Account for the time it takes to block/hit, too (timing bar)
                enemy.after(i * (config('enemy_ui_delay') + config('combo_time_seconds')), function() {
                    Crafty('TimingBar').show();
                    Game.currentEnemy = enemy;
                });
            });
        });

        Crafty.wait(Crafty('Enemy').length * (config('enemy_ui_delay') + config('combo_time_seconds')) + 1, function() {
            self.showUi();
            Game.currentEnemy = null;
            Game.turn = 'player';
        });
    });
}

Game.hideUi = function() {
    this.setUiVisible(false);
    Crafty('Player').select(null);
}

Game.showUi = function() {
    this.setUiVisible(true);
}

// private
Game.setUiVisible = function(boolValue) {
    Crafty.forEach('Button', function(b, i) {
        b.visible = boolValue;
    });
    Crafty('ComboText').visible = boolValue;
}

Crafty.c('StatusBar', {
    init: function() {
        this.requires('Actor, Text2').color('#BBBBBB');
    },

    show: function(message) {
        this.text(message).size(960, 36);
    }
});

Crafty.c('TimingBar', {
    init: function() {
        this.requires('Actor').color('white').size(915, 15).move(25, 370);
        this.hitArea = Crafty.e('Actor').color('purple').size(100, 25).move(740, 365);
        var self = Crafty('TimingBar');
        this.hide();
    },

    checkForHit: function() {
        // AABB: does hitBox overlap hitArea? Just compare X, because Y lines up.
        // This includes hitBox partially overlapping hitArea.
        if (this.hitBox != null && this.hitBox.attr('x') >= this.hitArea.attr('x') &&
            this.hitBox.attr('x') + this.hitBox.attr('w') <= this.hitArea.attr('x') + this.hitArea.attr('w')) {
                // SUCCESS!
                if (Game.turn == 'player') {
                    Crafty('Player').finishAttack(true);
                } else {
                    Game.currentEnemy.attack(true);
                }
            } else {
                // Missed.
                if (Game.turn == 'player') {
                    Crafty('Player').finishAttack(false);
                } else {
                    Game.currentEnemy.attack(false);
                }
            }
            this.hide();
    },

    hide: function() {
        this.visible = false;
        this.hitArea.visible = false;
        if (this.hitBox != null) {
            this.hitBox.die();
        }
    },

    show: function() {
        this.visible = true;
        this.hitArea.visible = true;

        var self = this;
        var comboTime = extern('combo_time_seconds');
        // Only reason to show = start combo
        self.hitBox = Crafty.e('Actor').size(25, 25).color('red').move(this.attr('x'), this.attr('y'))
            .tween({ x: this.attr('x') + this.attr('w') - 25 }, comboTime).after(comboTime + 0.1, function() {
                // Didn't click in time
                if (Game.turn == 'player') {
                    Crafty('Player').finishAttack(false);
                } else {
                    Game.currentEnemy.attack(false);
                }
                self.hide();
            });
    }
});

Crafty.c('Button', {
    init: function() {
        this.requires('Actor, Text2');
    },

    button: function(attack, callback) {
        this.text(attack).size(50, 50)
        .click(function() {
            Crafty('Player').attack(attack);
            if (callback != null) {
                callback();
            }
        });
        return this;
    }
});
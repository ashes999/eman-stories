package turbo.ecs.components;

import turbo.ecs.components.AbstractComponent;

/**
Anything with health. Has current/maximum health.
*/
class HealthComponent extends AbstractComponent
{
    public var currentHealth(default, null):Int = 0;
    public var maximumHealth(default, null):Int = 0;
    
    public function new(maximumHealth:Int, parent:Entity):Void
    {
        super(parent);
        // TODO: throw if <= 0
        this.currentHealth = maximumHealth;
        this.maximumHealth = maximumHealth;        
    }

    public function getHurt(damage:Int):Void
    {
        var wasDead = this.currentHealth <= 0;
        this.currentHealth -= damage;
        if (!wasDead && this.currentHealth <= 0)
        {
            this.trigger("Death");
        }
    }
}
import massive.munit.TestSuite;

import deengames.emanstories.data.RepositoryTest;
import deengames.emanstories.model.WorldTest;
import ExampleTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(deengames.emanstories.data.RepositoryTest);
		add(deengames.emanstories.model.WorldTest);
		add(ExampleTest);
	}
}

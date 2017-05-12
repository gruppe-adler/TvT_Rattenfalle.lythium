class GRAD_sandstorm {

	class client {
		file = grad_sandstorm\functions\client;

		class checkPlayerDamage {};
		class createBigParticles {};
		class createLeafs {};
		class createMediumParticles {};
		class createSandWall {};
		class createSmallParticles {};
		class createSticks {};
		class getSandWallPos {};
		class initClient {};
		class moveParticles {};
		class moveSandWall {};

	};

	class server {
		file = grad_sandstorm\functions\server;

		class serverLoop {};
		class syncSandWall {};
		
	};
};
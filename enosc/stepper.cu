/**
 * stepper.cu
 * 20150706
 *
 * stepper interface
 */

	/* includes */
#include "stepper.h"

#include <xis/singleton.h>
#include <xis/logger.h>

	/* con/destruction */
enosc::Stepper::Stepper()
{

		/* initialize configuration */
	_dt = 0;

}

	/* configuration */
void enosc::Stepper::configure( libconfig::Config const & config, std::string const & groupname )
{

	std::string paramname = groupname + "/time";
	std::string stepname = groupname + "/time_steps";
	if ( config.exists( paramname ) && config.exists( stepname ) ) {

			/* read settings */
		enosc::scalar start = config.lookup( paramname )[0];
		enosc::scalar stop = config.lookup( paramname )[1];

		unsigned int steps = config.lookup( stepname );

			/* set parameter values */
		_times.resize( steps+1 );
		_times[0] = start;
		for ( unsigned int i = 1; i < steps+1; ++i )
			_times[i] = start + i * (stop-start) / (enosc::scalar) steps;

		if ( _times.size() > 1 )
			_dt = _times[1] - _times[0];

	}

		/* logging */
	xis::Logger & logger = xis::Singleton< xis::Logger >::instance();

	logger.log() << "times: " << _times << "\n";

}

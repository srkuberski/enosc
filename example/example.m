function example( infile, outdir )
% test example
%
% EXAMPLE( infile, outdir )
%
% INPUT
% infile : data filename (row char)
% outdir : output directory (row char)

		% safeguard
	if nargin < 1 || ~isrow( infile ) || ~ischar( infile ) || exist( infile, 'file' ) ~= 2
		error( 'invalid argument: infile' );
	end

	if nargin < 2 || ~isrow( outdir ) || ~ischar( outdir )
		error( 'invalid argument: outdir' );
	end

		% initialize framework
	addpath( '../xis/' );

	logger = xis.hLogger.instance( 'example.m.log' );
	logger.tab( 'plot examples...' );

		% done
	logger.untab();
	logger.log( 'done.' );

end


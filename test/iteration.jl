module TestIteration
	using Base.Test
	using DataArrays
	using DataFrames

	dv = @data([1, 2, NA])
	dm = DataArray([1 2; 3 4])
	dt = DataArray(zeros(2, 2, 2))

	df = DataFrame(A = 1:2, B = 2:3)

	for el in dv
	    @assert ndims(el) == 0
	end

	for el in dm
	    @assert ndims(el) == 0
	end

	for el in dt
	    @assert ndims(el) == 0
	end

	for row in EachRow(df)
	    @assert isa(row, DataFrame)
	end

	for col in EachCol(df)
	    @assert isa(col, AbstractDataVector)
	end

	@assert isequal(map(x -> minimum(array(x)), EachRow(df)), {1,2})
	@assert isequal(map(minimum, EachCol(df)), DataFrame(A = [1], B = [2]))

	# @test_fail for x in df; end # Raises an error
end

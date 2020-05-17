LDLIBS=-lm -lstdc++ -lprotobuf
linux-sandbox: linux-sandbox.o linux-sandbox-options.o linux-sandbox-pid1.o process-tools.o logging.o execution_statistics.pb.cc

clean:
	rm -f *.o linux-sandbox

proto:
	protoc --cpp_out=. execution_statistics.proto
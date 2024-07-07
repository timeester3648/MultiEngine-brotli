void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("brotli");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./c/include"
	});

	properties.files({
		"./c/dec/**.h",
		"./c/dec/**.c",
		"./c/enc/**.h",
		"./c/enc/**.c",
		"./c/common/**.h",
		"./c/common/**.c",
		"./c/include/**.h"
	});

	{
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.disable_warnings({ "4334" });
	}
}
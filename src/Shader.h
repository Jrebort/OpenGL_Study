#pragma once
#include <string>

class Shader
{
private:
	std::string m_FilePatha;
	unsigned int m_RendererID;

public:
	Shader(const std::string& filepath);
	~Shader();

	void Bind() const;
	void Unbind() const;

	// set Uniforms
	void SetUniform4f(const std::string& name; float v0, float v1, float f2, float f3);

private:
	unsigned int GetUniformLocation(const std::string& name);
};


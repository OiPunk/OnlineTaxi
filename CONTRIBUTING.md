# Contributing to OnlineTaxi

Thank you for your interest in contributing to OnlineTaxi! This document provides guidelines and instructions for contributing.

## How to Contribute

### Reporting Issues

- Use the [GitHub Issues](https://github.com/OiPunk/OnlineTaxi/issues) page
- Include a clear title and description
- Provide steps to reproduce the issue
- Include relevant logs and screenshots

### Submitting Changes

1. **Fork** the repository
2. **Create a branch** from `master`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes** and commit with clear messages:
   ```bash
   git commit -m "Add: brief description of the change"
   ```
4. **Push** to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
5. **Open a Pull Request** against the `master` branch

### Commit Message Guidelines

Use the following prefixes:
- `Add:` for new features
- `Fix:` for bug fixes
- `Update:` for enhancements to existing features
- `Refactor:` for code restructuring
- `Docs:` for documentation changes
- `Test:` for test additions or modifications

### Code Style

- Follow standard Java naming conventions
- Use 4 spaces for indentation (no tabs)
- All comments and documentation must be in **English**
- Do not commit sensitive data (API keys, passwords, personal paths)
- Use environment variables for configuration (see `.env.example`)

### Development Setup

See the [README.md](README.md) for setup instructions.

### Pull Request Checklist

- [ ] Code compiles without errors
- [ ] All comments are in English
- [ ] No sensitive data is included
- [ ] Environment variables are used for credentials
- [ ] Changes are documented in the PR description

## Security

If you discover a security vulnerability, please do **NOT** open an issue. Instead, email the maintainers directly.

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).

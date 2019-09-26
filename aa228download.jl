# Download AA228Student and RedPen repositories
# Robert Moss | mossr@stanford.edu | Sep. 2019
if VERSION < v"1.2"
    error("Julia v1.2 is required. Your current version is v$VERSION")
end

using Pkg
using LibGit2

@info "Downloading RedPen and AA228Student (requires git)..."

# Download Obfuscatee as a package
Pkg.add(PackageSpec(url="https://github.com/sisl/Obfuscatee.jl.git"))

# Download RedPen as a package
Pkg.add(PackageSpec(url="https://github.com/sisl/RedPen.jl.git"))

function gitpull(repo::GitRepo)
    LibGit2.fetch(repo)
    LibGit2.merge!(repo)
end

# Download/update AA228Student repository
if basename(pwd()) == "AA228Student"
    aa228path = pwd()
    repo = GitRepo(aa228path)
    gitpull(repo)
elseif isdir("AA228Student")
    # Update repo if it exists
    aa228path = joinpath(pwd(), "AA228Student")
    repo = GitRepo(aa228path)
    gitpull(repo)
else
    # Download AA228Student as a local repo, then add it as a package
    # Clone repo if it doesn't exist
    LibGit2.clone("https://github.com/sisl/AA228Student.jl.git", "AA228Student")
    aa228path = joinpath(pwd(), "AA228Student")
end

# Add AA228Student as a local package
@info string("Using AA228Student repository from: ", aa228path)
Pkg.add(PackageSpec(path=aa228path))

@info "Precompiling AA228Student..."
Pkg.build()
using AA228Student # Precompiles packages
@info string("Please submit projects from the following directory:\n", joinpath(aa228path, "workspace"))
# Download AA228Student and RedPen repositories
# Robert Moss | mossr@stanford.edu | Sep. 2019

using Pkg

@info "Downloading RedPen and AA228Student (requires git)..."

# Download Obfuscatee as a package
Pkg.add(PackageSpec(url="https://github.com/sisl/Obfuscatee.jl.git"))

# Download RedPen as a package
Pkg.add(PackageSpec(url="https://github.com/sisl/RedPen.jl.git"))

# Download/update AA228Student repository
if basename(pwd()) == "AA228Student"
    run(`git pull --rebase`)
    aa228path = pwd()
elseif isdir("AA228Student")
    # Update repo if it exists
    cd("AA228Student") do
        run(`git pull --rebase`)
    end
    aa228path = joinpath(pwd(), "AA228Student")
else
    # Download AA228Student as a local repo, then add it as a package
    # Clone repo if it doesn't exist
    run(`git clone https://github.com/sisl/AA228Student.jl.git AA228Student`)
    aa228path = joinpath(pwd(), "AA228Student")
end

# Add AA228Student as a local package
@info "Using AA228Student repository from: $aa228path"
Pkg.add(PackageSpec(path=aa228path))

@info "Precompiling AA228Student..."
using AA228Student # Precompiles packages

@info "Please submit projects from the following directory:\n$(joinpath(aa228path, "workspace"))"
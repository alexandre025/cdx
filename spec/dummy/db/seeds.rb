Cdx::User.create(email: 'admin@cdx.io', password: 'cdx123', roles: Cdx::User::ROLES)

Cdx::Taxonomy.create(name: 'Catégories')
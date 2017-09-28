Cdx::User.create(email: 'admin@cdx.io', password: 'cdx123', roles: Cdx::User::AVAILABLE_ROLES)

Cdx::Taxonomy.create(name: 'Catégories')
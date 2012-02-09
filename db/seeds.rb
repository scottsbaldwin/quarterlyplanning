# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Quarter.create([
{ id: 1, name: "2012Q1" },
{ id: 2, name: "2012Q2" },
{ id: 3, name: "2012Q3" },
{ id: 4, name: "2012Q4" }
])

Sprint.create([
{ name: '2012.01.11', quarter_id: 1 },
{ name: '2012.01.25', quarter_id: 1 },
{ name: '2012.02.08', quarter_id: 1 },
{ name: '2012.02.22', quarter_id: 1 },
{ name: '2012.03.07', quarter_id: 1 },
{ name: '2012.03.21', quarter_id: 1 }
])

Initiative.create([
{ name: "Launch census experience", priority: 1, quarter_id: 1 },
{ name: "Launch autosomal DNA 1.0", priority: 2, quarter_id: 1 },
{ name: "Launch FB app 1.5", priority: 3, quarter_id: 1 },
{ name: "Continuous Delivery", priority: 4, quarter_id: 1 },
{ name: "Deliver Project X prototypes", priority: 5, quarter_id: 1 },
{ name: "Launch Hints 2.0", priority: 6, quarter_id: 1 },
{ name: "Deliver SEO infrastructure", priority: 7, quarter_id: 1 }
])

Team.create([
{ name: "Ancestry Publisher", group: "Services"},
{ name: "Ancestry Shared Services", group: "Applications"},
{ name: "Continuous Delivery Tools", group: "Ops"},
{ name: "Automated Content", group: "Services"},
{ name: "Interactive Image", group: "Applications"},
{ name: "CMS", group: "Services"},
{ name: "Creative", group: "Design"},
{ name: "User Data Services", group: "Services"},
{ name: "BIT", group: "Other"},
{ name: "DNA Applications", group: "Applications"},
{ name: "Indexing", group: "Services"},
{ name: "Imaging", group: "Services"},
{ name: "Enterprise Media", group: "Services"},
{ name: "FED", group: "Applications"},
{ name: "Finance", group: "Other"},
{ name: "Facebook Experience", group: "Applications"},
{ name: "Mobile Touch Web", group: "Applications"},
{ name: "Marketing", group: "Other"},
{ name: "Merlin", group: "Applications"},
{ name: "Order Services", group: "Services"},
{ name: "Search and Aggregation Services", group: "Services"},
{ name: "Trees Services", group: "Services"},
{ name: "Trees Applications", group: "Applications"},
{ name: "AppOps", group: "Ops"},
{ name: "Oracle", group: "Other"},
{ name: "Performance", group: "Other"},
{ name: "Person Rank", group: " Sequoia", group: " Tree Graph", group: "Services"},
{ name: "API", group: "Applications"},
{ name: "Search Admin and Management", group: "Services"},
{ name: "Search Engine", group: "Services"},
{ name: "Sharing", group: "Applications"},
{ name: "Search Applications", group: "Applications"},
{ name: "Commons", group: "Applications"},
{ name: "Signup", group: "Applications"},
{ name: "Guidance", group: "Applications"},
{ name: "Company Operations", group: "Other"},
{ name: "Facebook Integration", group: "Applications"},
{ name: "Content Admin", group: "Services"},
{ name: "UX", group: "Design"},
{ name: "VAT", group: "Other"},
{ name: "Data Science", group: "Other"},
{ name: "FTM", group: "Applications"},
{ name: "iOS", group: "Applications"},
{ name: "Android", group: "Applications"},
{ name: "Payment Services", group: "Services"},
{ name: "DNA Services", group: "Services"},
{ name: "WebOps", group: "Ops"},
{ name: "DNA Backend", group: "Services"}
])

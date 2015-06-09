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
{ name: "Ancestry Publisher", grouping: "Services"},
{ name: "Ancestry Shared Services", grouping: "Applications"},
{ name: "Continuous Delivery Tools", grouping: "Other"},
{ name: "Automated Content", grouping: "Services"},
{ name: "Interactive Image", grouping: "Applications"},
{ name: "CMS", grouping: "Services"},
{ name: "Creative", grouping: "Other"},
{ name: "User Data Services", grouping: "Services"},
{ name: "BIT", grouping: "Other"},
{ name: "DNA Applications", grouping: "Applications"},
{ name: "Indexing", grouping: "Services"},
{ name: "Imaging", grouping: "Services"},
{ name: "Enterprise Media", grouping: "Services"},
{ name: "FED", grouping: "Applications"},
{ name: "Finance", grouping: "Other"},
{ name: "Facebook Experience", grouping: "Applications"},
{ name: "Mobile Touch Web", grouping: "Applications"},
{ name: "Marketing", grouping: "Other"},
{ name: "Merlin", grouping: "Applications"},
{ name: "Order Services", grouping: "Services"},
{ name: "Search and Aggregation Services", grouping: "Services"},
{ name: "Trees Services", grouping: "Services"},
{ name: "Trees Applications", grouping: "Applications"},
{ name: "AppOps", grouping: "Other"},
{ name: "Oracle", grouping: "Other"},
{ name: "Performance", grouping: "Other"},
{ name: "Person Rank", grouping: " Sequoia", grouping: " Tree Graph", grouping: "Services"},
{ name: "API", grouping: "Applications"},
{ name: "Search Admin and Management", grouping: "Services"},
{ name: "Search Engine", grouping: "Services"},
{ name: "Sharing", grouping: "Applications"},
{ name: "Search Applications", grouping: "Applications"},
{ name: "Commons", grouping: "Applications"},
{ name: "Signup", grouping: "Applications"},
{ name: "Guidance", grouping: "Applications"},
{ name: "Company Operations", grouping: "Other"},
{ name: "Facebook Integration", grouping: "Applications"},
{ name: "Content Admin", grouping: "Services"},
{ name: "UX", grouping: "Other"},
{ name: "VAT", grouping: "Other"},
{ name: "Data Science", grouping: "Other"},
{ name: "FTM", grouping: "Applications"},
{ name: "iOS", grouping: "Applications"},
{ name: "Android", grouping: "Applications"},
{ name: "Payment Services", grouping: "Services"},
{ name: "DNA Services", grouping: "Services"},
{ name: "WebOps", grouping: "Other"},
{ name: "DNA Backend", grouping: "Services"}
])

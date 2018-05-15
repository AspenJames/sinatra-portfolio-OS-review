### To reset to a clean db, delete db/database.sqlite followed by rake db:setup to load migrations and seed data ###

## Users ##

User.create(name: "Aspen James", email: "aspenjames@tqca.org", username: "Aspen", password: "secure")
User.create(name: "Linus Torvalds", email: "linus@linux.com", username: "Linux_Creator", password: "Wind0ws*Suck$")
User.create(name: "Cali", email: "dog@woof.co", username: "Cali_dog", password: "doggie")

## Operating Systems ##

OperatingSystem.create(name: "Windows 10", platform: "Microsoft", screenshot: "https://www.extremetech.com/wp-content/uploads/2015/10/Windows-10-desktop.jpg")
OperatingSystem.create(name: "Ubuntu 18.04", platform: "Linux", screenshot: "https://assets.ubuntu.com/v1/3a05fc34-Dell_XPS_Laptop_Front-news.png")
OperatingSystem.create(name: "Puppy Linux", platform: "Linux", screenshot: "http://puppylinux.com/screenshots/tahr64.jpg")

## Reviews ##

Review.create(user_id: "1", operating_system_id: "2", content: "Super slick operating system, and my definite go-to recommendation for new users looking into Linux. The support, documentation, and community around Ubuntu are all amazing. Ubuntu is the perfect mix of user-friendliness and customizability that will leave almost all users satisfied!")
Review.create(user_id: "2", operating_system_id: "1", content: "This is total trash. Unless, of course, you enjoy endless bloatware, unintuitive and frustrating updates, and HUGE amounts of telemetry data being sent to Microsoft.")
Review.create(user_id: "3", operating_system_id: "3", content: "This is my favorite operating system. It's named after a puppy, and I'm a puppy!")
Review.create(user_id: "2", operating_system_id: "2", content: "Pretty cool what they made of my creation, Debian.")
Review.create(user_id: "1", operating_system_id: "3", content: "My dog really likes this OS. It's also extremely lightweight - great for thrift store finds and old hardware!")

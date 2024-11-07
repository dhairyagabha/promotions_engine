// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)


import RailsNestedForm from "@stimulus-components/rails-nested-form"
application.register("nested-form", RailsNestedForm)

import Dropdown from "@stimulus-components/dropdown"
application.register("dropdown", Dropdown)
# Gattoni Web Dev

Our Landing page

## Prerequisites

Ensure you have the following installed on your system:

*   [Ruby](https://www.ruby-lang.org) (`3.2.9`)
*   [Rails](https://guides.rubyonrails.org/getting_started.html) (`8.1.1`)
*   A database (not yet needed)

## Installation

Follow these steps to get the application running locally:

1.  **Clone the repository:**
    ```bash
    git clone git@github.com:quiltyweb/gattoniwebdev.git
    cd gattoniwebdev
    ```

2.  **Install the gems:**
    ```bash
    bundle install
    ```

3.  **Set up the database:**
    *   not yet needed, as we aren't persisting record on a db at the moment.


## Usage

*   **Start the server:**
    ```bash
    bin/dev
    ```
    The application will be available at `http://localhost:3000`.

*   **Run the test suite:**
    ```bash
    rails test
    ```

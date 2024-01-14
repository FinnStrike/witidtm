from bs4 import BeautifulSoup

def process_html_file(file_path):
    with open(file_path, 'r') as file:
        # Read the HTML content
        html_content = file.read()
    print(file_path)

    # Parse the HTML content
    soup = BeautifulSoup(html_content, 'html.parser')

    # Find all <p> tags and process them
    for p_tag in soup.find_all('p'):
        # Check if the <p> tag contains <button-list>
        list = p_tag.find_all('button-list')
        if list:
            print("- Found <Button-List> tag!")
            # Find the next sibling <ul> tag
            next_ul = p_tag.find_next_sibling('ul')
            if next_ul:
                # Remove the <p> tag
                p_tag.decompose()
                # Add class="button-list" to the <ul> tag
                next_ul['class'] = ['button-list']
                print(f"  Added class='button-list' attribute to the next <{next_ul.name}> tag")
            else:
                print(f"  Error: No <ul> tag found after <Button-List> tag")

    # Write the changes back to the HTML file
    with open(file_path, 'w') as file:
        file.write(str(soup))

# Process Files
process_html_file('materials.html')

import React, { Component } from 'react';
import { ListGroupItem, Button, Modal, ModalHeader, ModalBody, Form, FormGroup, Label, Input } from 'reactstrap';
import { Link } from 'react-router-dom'
import { updateProject } from '../actions/projects'
import { connect } from 'react-redux'

class ProjectInfo extends Component {

    constructor(props) {
        super(props);
        
        this.state = {
            name: this.props.projectInfo.name,
            description: this.props.projectInfo.description,
            modal: false,
        };

        this.toggle = this.toggle.bind(this);
    }
    
    toggle() {
        this.setState(prevState => ({
            modal: !prevState.modal
        }));
    }

    handleChange = event => {
        this.setState({ [event.target.name]: event.target.value })
    }

    submitForm = event =>{
        event.preventDefault();
        this.props.updateProject(this.props.projectInfo.id, this.state.name, this.state.description);
        this.toggle();
    }

    render() {
        const { user, projectInfo, locked} = this.props;
        const owner = (user && !locked && this.props.currentUserId === user.id)? true : false;
        
        return (
        <ListGroupItem className="pb-0">
            <Link to={"/editor/"+projectInfo.userId} className="link">{projectInfo.name} </Link>
                
            {/* Edit Project Only If Owner */}
            {owner &&
                <span className="edit" onClick={this.toggle}>edit</span>
            }
            <p>{projectInfo.description}</p>

            {/* Edit Project Info Modal */}
            <Modal isOpen={this.state.modal} toggle={this.toggle} className={this.props.className}>
                <ModalHeader toggle={this.toggle}>{projectInfo.name}</ModalHeader>
                <ModalBody>

                     {/* Edit Project Name */}
                    <Form onSubmit={this.submitForm}>
                        <FormGroup>
                            <Label for={"ProjectName" + projectInfo.id}>Project Name</Label>
                            <Input
                                type="text" 
                                name="name"
                                id={"ProjectName" + projectInfo.id} 
                                value={this.state.name} 
                                onChange={this.handleChange}
                                placeholder="Add project name"
                            />
                        </FormGroup>

                        {/* Edit Project Description */}
                        <FormGroup>
                            <Label for={"Description" + projectInfo.id}>Description (Optional)</Label>
                            <Input 
                                className = "no-scale-textarea" 
                                type="textarea" 
                                rows="4"
                                name="description"
                                id={"Description" + projectInfo.id} 
                                value={this.state.description} 
                                onChange={this.handleChange} 
                                placeholder="Add short project description"
                            />
                        </FormGroup>

                        <Button color="success">Submit</Button>
                    </Form>
                </ModalBody>
            </Modal>
        </ListGroupItem>
        )
    }
}

const mapStateToProps = state => ({
    user: state.user,
    currentUserId: state.currentUserId
})

const mapDispatchToProps = dispatch => ({
    updateProject: (id, name, description) => dispatch(updateProject(id, name, description))
})

export default connect(mapStateToProps, mapDispatchToProps)(ProjectInfo);
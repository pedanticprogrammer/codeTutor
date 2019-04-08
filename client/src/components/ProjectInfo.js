// Provides script information
import React, { Component } from 'react';
import { ListGroupItem, Button, Modal, ModalHeader, ModalBody, Form, FormGroup, Label, Input } from 'reactstrap';
import { Link } from 'react-router-dom'

export default class ProjectInfo extends Component {

    constructor(props) {
        super(props);
        this.state = {
            name: this.props.name,
            description: this.props.description,
            modal: false, 
        };
        this.toggle = this.toggle.bind(this);
        this.updateName = this.updateName.bind(this);
        this.updateDescription = this.updateDescription.bind(this);
    }
    
    toggle() {
        this.setState(prevState => ({
        modal: !prevState.modal
        }));
    }

    updateName(event){
        this.setState({name: event.target.value});
    }

    updateDescription(event){
        this.setState({description: event.target.value});
    }

    render() {
        const projectInfo = this.props;
        return (
        
        <ListGroupItem className="pb-0">
            <Link to="/editor" className="title-link">{this.state.name} </Link>
            <span className="edit" onClick={this.toggle}>edit</span>
            <p>{this.state.description}</p>
            <Modal isOpen={this.state.modal} toggle={this.toggle} className={this.props.className}>
                <ModalHeader toggle={this.toggle}>{this.state.name}</ModalHeader>
                <ModalBody>
                    <Form onSubmit={this.toggle}>
                        <FormGroup>
                            <Label for={"ProjectName" + projectInfo.id}>Project Name</Label>
                            <Input
                                type="text" 
                                id={"ProjectName" + projectInfo.id} 
                                value={this.state.name} 
                                onChange={this.updateName}
                                placeholder="Add project name"
                            />
                        </FormGroup>
                        <FormGroup>
                            <Label for={"Description" + projectInfo.id}>Description (Optional)</Label>
                            <Input 
                                className = "no-scale-textarea" 
                                type="textarea" 
                                rows="4" 
                                id={"Description" + projectInfo.id} 
                                value={this.state.description} 
                                onChange={this.updateDescription} 
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

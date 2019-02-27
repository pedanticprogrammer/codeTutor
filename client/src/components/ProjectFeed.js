import React, { Component } from 'react';
import { ListGroup } from 'reactstrap';
import ScriptInfo from './ScriptInfo.js';

export default class ProjectFeed extends Component {
    render() {
        return (
        <ListGroup flush>
            <ScriptInfo/>
            <ScriptInfo/>
        </ListGroup>
        )
    }
}
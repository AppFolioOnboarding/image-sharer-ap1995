import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';

class Footer extends Component {
  render() {
    return (
      <div>
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            <p color="muted" className='text-center' style={{ "fontSize":"10px" }}>Copyright: AppFolio Inc. Onboarding</p>
          </Col>
        </Row>
      </div>
    )
  }
}

export default Footer;

import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { NativeModules, Platform } from 'react-native'

const { RNHomeIndicator } = NativeModules
const isIos = Platform.OS === 'ios'


const propTypes = {
    autoEdgeProtection: PropTypes.bool.isRequired,
}

export class HomeIndicator extends Component {
    static propsHistory = [];

    static popAndGetPreviousProps() {
        HomeIndicator.propsHistory.pop()
        return HomeIndicator.propsHistory[HomeIndicator.propsHistory.length - 1] || {}
    }

    componentDidMount() {
        if (!isIos) return

        const { autoEdgeProtection } = this.props
        HomeIndicator.propsHistory.push(this.props)

        updateNativeHomeIndicator({ autoEdgeProtection })
    }

    componentWillUnmount() {
        if (!isIos) return

        const { autoEdgeProtection } = HomeIndicator.popAndGetPreviousProps()
        updateNativeHomeIndicator({ autoEdgeProtection })
    }

    render() { return null }
}

HomeIndicator.propTypes = propTypes

function updateNativeHomeIndicator({ autoEdgeProtection = false }) {
    if (autoEdgeProtection) {
        RNHomeIndicator.autoEdgeProtection()
    } else {
        RNHomeIndicator.alwaysVisible()
    }
}

export default HomeIndicator

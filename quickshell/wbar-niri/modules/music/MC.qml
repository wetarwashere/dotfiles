pragma Singleton

import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Singleton {
    id: mcRoot

    property string mcMusicTitle: Mpris.players.values[0].trackTitle
    property string mcMusicArtist: Mpris.players.values[0].trackArtist
    property string mcMusicFormatted: mcMusicTitle.length < 5 ? mcStateIcons + mcMusicTitle + " - " + mcMusicArtist : mcStateIcons + mcMusicTitle
    property bool isPlaying: Mpris.players.values[0].playbackState === MprisPlaybackState.Playing
    property string mcStateIcons: isPlaying ? " " : " "
}

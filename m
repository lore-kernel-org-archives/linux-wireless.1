Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324361;
	b=NjjTXagVEtNfbrTqexNLgtudIGenZ/10FoHOg21tYSx3ldKGvoCp2tleGZOtFEV9F4e7
	 e7dN1vs423a/KhOx/OZHYO8bJThTYBVZbHF8EjqrcLKRoAbYTCKQWZlPefAYSNKCXZ2+r
	 Rpn4WKTxmJQB5YBa4herSmYr1LkpK15Wba6XxNNQsT5ejo/7GYQdb5H+SFom3Xv+THJJS
	 fgD5RpMK0uEpC3ymuGZVmfQUqZ+jRh342/jfn01scEAPdCzhfsYHMQsmmZ1h/xy9kQhlB
	 g7JJDFIayfDroIZiQaRWMh7pWEkeg2REOBwwm8Ddpk9rbUm72N+SO4mml9dZzbtBaKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324361;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZIpx1CvUVePHZmyIE8GGZIgBPXohfgEY4mrr3E1eg1g=;
	b=0pOUff5ikuCv6NCKDWe5EtdKWWVswVMh0POxjKQlukBccUEG3fy1UzdbZszYtarh113G
	 mqdaVGal7Z62ptkXMp4Xknkso1j0EuZmLxIRLKOKljBqLDAS7Rd/NAIZzS4dWszn5hDoh
	 JM/HbehHqc0VdtwiJPUI4ghh4pvwfMMiuSlNVlX97RWus6C9Qs4SS7ME8oUkhGZp+IPOo
	 RXprzU48BmNLWk+IpYWkhbyKqDnVTDUKh8NiGUSAfeWtWyeyYC+gPdrANSeQZox9pfC4g
	 M05oxllbGZ952TLim0X4F68sSrD9qmz1gU4ElJuueTccf26925OSuQee7tS7OvqaqEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6fpopX6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157F4606A320;
	Sun, 22 Nov 2026 05:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6fpopX6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324360;
	b=EFCd7HU5dO0f/TmvGZJr/u+yFLSboYsHJbyxv/PU8wvUPge/7nURrGJORNGA63H7Bf/F
	 biAlXrCF1iPRQA3udl4a1fc7aL162JLAGTGOAOpXZu1Qzhk4CghYnpRKjRTOxq6Kyj93B
	 Pn8tAOchO3ncWLSQh4WkTmOmW2Ccdqzr7ghTMp9a2vsS4gm8q1EtUmiZU7oZ9Z9EcC9in
	 g4TyfB4A4mC2EdpL/xasEZYphDCdvGbXp//eRAobb3ZG3hO8m8jR8731Y6sVH6IwdkqP1
	 d8ah9DxPRUrtvyX3IA2kyx8KnqTTPjtnZNNXf2GdY1GghBaLpQJ6Q327a07NAzD60NQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324360;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZIpx1CvUVePHZmyIE8GGZIgBPXohfgEY4mrr3E1eg1g=;
	b=rJiAg5pqv7m3+EbJQPeKoVRyulqag86EsuMHpSP2to1OQKYnjmLiw5jmZS4QApYkwszJ
	 ZOclyz16v1ZdFYfbHl9oqXBDyJXIpuLJSReksrEYbcLgCXNz1FnmQtcT4J4KBhV89aDK3
	 1WpdpujvEdCgKf1QxzF/PbqAx+Gy04CsLY96/9XB1NuvDSRHbxE9VFsC8H5h6Pflv8ccq
	 QDwtpxK+8Vp7/NTTuYjMyHmA6SLMThoBmdLM0xLh2spQIQ49i1pQ7XiFYuVYSPQC0dBtm
	 FDCDpljKdFLDxiHnB4lr3oelEBN5Yo2Vx+Pm1o1GezHs1GA1SDhkxNq9U0+OTQbyY2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 187E11F000D1;
	Sun, 22 Nov 2026 05:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324360;
	bh=ZIpx1CvUVePHZmyIE8GGZIgBPXohfgEY4mrr3E1eg1g=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=n6fpopX6CJBSU3RzLeviems7udVDwkLEWIQdS6USJi72xrvEeNL0Z3VyhbmompTdy
	 4fF92ckdCm/yLCAT9TfoUlOnAgjgwetBzmDi63mWcDFjwHujNjcdfiLP9JvQEKIDjm
	 /U7PbhBlq+9XkigwQS6xSK9X89o7JOuUTyErVPP76sRlDAM8nhJ/LawLWRjKCbQvd9
	 d65Cet2Gmk5N3j9CvqMNMElISY6+laUnkJdMFsxYoNI6Dbg1opjz6vvBvMg87lSkY7
	 8CTkjqFfRV55k2c60mLNbJnXLIL6KeqOH/SmaxWt9fKM0O8POwuf4Db6chEb3F14jf
	 leGbgtEoasrfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9E5274BF13;
	Sun, 22 Nov 2026 05:12:39 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:12:37 +0000
Subject: [PATCH] wifi: wlcore: Don't register a 5 GHz band that wl18xx has
 disabled
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-wlcore-5ghz-band-v1-1-2b40404c8bf8@enser.io>
X-B4-Tracking: v=1; b=H4sIAMR5AmsC/yXMzQ6CMBAE4Fche3bVroCJr2I89GdLa0wxWwUi4
 d1t9fhNZmaFzBI5w6VZQXiKOY6pQO0asEGngTG6YqAj9UoRoWlxfthRGLshfNDo5NCr3p1Ie3b
 UQVk+hX1cfq/X29/5be5sX/WqNozOjEZ0sqFGlYfpvG9RLMG2fQFzPpNOlwAAAA==
X-Change-ID: 20261122-b4-wlcore-5ghz-band-f16d32afed25
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324357; l=5757;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=qM43epsCGMsi06MxRUqGsCIvRIKK+ZmvzXTyCV4oyLg=;
 b=bdeXTvKiT/9Xxmj9h85Q55jPzyZ7rhkQWCM848iJvQ2T7Yo3wozS3oGy1F7GR6Ul5A4SSb1yn
 JnCEDTYtkIVB/DVfUER3g5zzSzvvBErV6gL2QLVJ2weWR26ALxzTwC7
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

wl18xx settles 5 GHz support in wl18xx_setup(), from the conf's
number_of_assembled_ant5, before the hardware is registered. wlcore
registers the 5 GHz band anyway, with every channel, and only empties it
(n_channels = 0) once the firmware has booted. That path was written for
wl12xx, where the answer really does come from the NVS at boot.

Userspace that reads the wiphy in between keeps the 5 GHz channel list.
iwd's scans then fail every five minutes with

    Received error during CMD_TRIGGER_SCAN: Invalid argument (22)

and no networks are ever listed. The likely mechanism is a scan request
naming channels the wiphy no longer has, which nl80211_trigger_scan()
refuses. Seen on a Tegra Note 7, whose WL18xx module is 2.4 GHz only and
whose vendor conf sets number_of_assembled_ant5 = 0. A fresh install
never joined WiFi; with the conf removed (5 GHz back to 31 channels) it
connected in under a minute, and `iw dev wlan0 scan` worked throughout.

Leave the band unregistered when it is already known to be off, and make
the three places that dereference wiphy->bands[] tolerate the NULL a
2.4 GHz-only wl18xx now leaves there. Those three are the only
dereferences of wiphy->bands[] in wlcore and wl18xx. wl12xx is unchanged,
because it does not set enable_11a_from_setup, so it still registers the
band and trims it at boot.

Tested on that board: `iw phy` lists only the 2.4 GHz band, iwd connects
and lists networks, and a boot of nearly ten days logged no
CMD_TRIGGER_SCAN errors.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Fixes: e166de556f77 ("wl18xx: number_of_assembled_ant5 indicates if A band is enabled")
Signed-off-by: EMCP333 <emcp@enser.io>
---
 drivers/net/wireless/ti/wl18xx/main.c   |  1 +
 drivers/net/wireless/ti/wlcore/cmd.c    |  2 ++
 drivers/net/wireless/ti/wlcore/main.c   | 14 +++++++++++---
 drivers/net/wireless/ti/wlcore/tx.c     |  2 ++
 drivers/net/wireless/ti/wlcore/wlcore.h |  6 ++++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ti/wl18xx/main.c b/drivers/net/wireless/ti/wl18xx/main.c
index d087d9c72f..9b9c5163c3 100644
--- a/drivers/net/wireless/ti/wl18xx/main.c
+++ b/drivers/net/wireless/ti/wl18xx/main.c
@@ -2054,6 +2054,7 @@ static int wl18xx_setup(struct wl1271 *wl)
 
 	/* Enable 11a Band only if we have 5G antennas */
 	wl->enable_11a = (priv->conf.phy.number_of_assembled_ant5 != 0);
+	wl->enable_11a_from_setup = true;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ti/wlcore/cmd.c b/drivers/net/wireless/ti/wlcore/cmd.c
index 04d0bb8460..138c65406d 100644
--- a/drivers/net/wireless/ti/wlcore/cmd.c
+++ b/drivers/net/wireless/ti/wlcore/cmd.c
@@ -1709,6 +1709,8 @@ int wlcore_cmd_regdomain_config_locked(struct wl1271 *wl)
 
 	for (b = NL80211_BAND_2GHZ; b <= NL80211_BAND_5GHZ; b++) {
 		band = wiphy->bands[b];
+		if (!band)
+			continue;
 		for (i = 0; i < band->n_channels; i++) {
 			struct ieee80211_channel *channel = &band->channels[i];
 			u16 ch = channel->hw_value;
diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
index 26aabf4ea1..6a18e60e69 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -2439,7 +2439,7 @@ static int wl12xx_init_fw(struct wl1271 *wl)
 	 * Now we know if 11a is supported (info from the NVS), so disable
 	 * 11a channels if not supported
 	 */
-	if (!wl->enable_11a)
+	if (!wl->enable_11a && wiphy->bands[NL80211_BAND_5GHZ])
 		wiphy->bands[NL80211_BAND_5GHZ]->n_channels = 0;
 
 	wl1271_debug(DEBUG_MAC80211, "11a is %ssupported",
@@ -6307,8 +6307,16 @@ static int wl1271_init_ieee80211(struct wl1271 *wl)
 
 	wl->hw->wiphy->bands[NL80211_BAND_2GHZ] =
 		&wl->bands[NL80211_BAND_2GHZ];
-	wl->hw->wiphy->bands[NL80211_BAND_5GHZ] =
-		&wl->bands[NL80211_BAND_5GHZ];
+	/*
+	 * Do not advertise a 5 GHz band that is already known to be off. It
+	 * used to be registered with every channel and emptied once the
+	 * firmware booted, so userspace that read the channel list first
+	 * (iwd) later asked for 5 GHz scans the band no longer had, and
+	 * nl80211 refused every one with -EINVAL: no networks, ever.
+	 */
+	if (wl->enable_11a || !wl->enable_11a_from_setup)
+		wl->hw->wiphy->bands[NL80211_BAND_5GHZ] =
+			&wl->bands[NL80211_BAND_5GHZ];
 
 	/*
 	 * allow 4 queues per mac address we support +
diff --git a/drivers/net/wireless/ti/wlcore/tx.c b/drivers/net/wireless/ti/wlcore/tx.c
index 75cfbcfb76..99d17d59f0 100644
--- a/drivers/net/wireless/ti/wlcore/tx.c
+++ b/drivers/net/wireless/ti/wlcore/tx.c
@@ -446,6 +446,8 @@ u32 wl1271_tx_enabled_rates_get(struct wl1271 *wl, u32 rate_set,
 	int bit;
 
 	band = wl->hw->wiphy->bands[rate_band];
+	if (!band)
+		return 0;
 	for (bit = 0; bit < band->n_bitrates; bit++) {
 		if (rate_set & 0x1)
 			enabled_rates |= band->bitrates[bit].hw_value;
diff --git a/drivers/net/wireless/ti/wlcore/wlcore.h b/drivers/net/wireless/ti/wlcore/wlcore.h
index 1f8511bf9b..3d316949e3 100644
--- a/drivers/net/wireless/ti/wlcore/wlcore.h
+++ b/drivers/net/wireless/ti/wlcore/wlcore.h
@@ -357,6 +357,12 @@ struct wl1271 {
 
 	bool enable_11a;
 
+	/*
+	 * enable_11a was settled before registration (wl18xx: from the conf)
+	 * rather than by the firmware boot (wl12xx: from the NVS).
+	 */
+	bool enable_11a_from_setup;
+
 	int recovery_count;
 
 	/* Most recently reported noise in dBm */

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-wlcore-5ghz-band-f16d32afed25

Best regards,
--  
EMCP333 <emcp@enser.io>



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697151;
	b=4Ta7r0O4gqZHgXMCiT+/CFlqptlOY2j16XrISu/7dF7lJIsy3MA4Jo6Zhp+sMM/gs+4B
	 xu8HbKWQ26vyM+/mb7lTbexYtDnqWfgJFn83KpWowu+5cre91hSf776FXoTdYoFeCZsfc
	 Llyy9gxQxD6MICo/EppO97d5reC0xXwTE3rg6dhlPbPVIgyLN6pwpQDXpnJ2jvHTdVF6u
	 pQpZ1HrvSWhEo5GP1Ty8VC8zyzPXjpWwsazRB9bagPF4xSUifKsSUAn2gA1ySOa1kBAkG
	 K4RX/xBgPGMTn7PGX79pKAICmGwz23HFA0aBRblyWWcLDH2SYi8TWVUGCwrSZoUNJzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
	b=I0jD5YDG4zZPUMseYddsw5K9a8H7DI8rb+tVFWgZzXUXv+5Xf1dZnxqjAMZKw733zJk7
	 orhjeYVrRQ4lRmfqkEWvR3dhZRop9VxEBA4TYTRNwodR0Y5t974YzKyZBe3HnVbgPr/LS
	 Ai2emRG02QXiAp2Z692c7U23uoIrFgf1x41xqiBp9isRg5UjxNafMesQe5DI8xvPjN/ua
	 E3+AU5f1+6spJCnxVSXISETPkUW3TJ6AqjJRbslrUGbywA/w6WsxB7qwj2TO3fILmdpmH
	 k490SEuSgTEaQKcfjJy7/sFtNwF7iqoW7d1hMBDs2BU0vKlJZpN5QU5cB+qa0dfoRow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wKkx1sK9;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D957D606A327
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 22:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D957D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wKkx1sK9
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50933bdf4bso477082166b.1
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 14:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697148; x=1795301948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
        b=wKkx1sK9/s44D46mlZTRd6mXKtuPQxJUju21Q9KRFhB+bet1SvuGecGDONTw/KfvEn
         zZb8KltACxdpIj3Mpf7Otdfw3XNewX7gbhz9Ut8b2FUp6+1DfK+cgy/uyuhwoSxwSZ7J
         wJDE7PoIWUW8NZiJ9eFX79vohtmYbD5wjAB/yHpkO0py0yG44PR8tsyO0HEiHFPmPr5c
         VojoGk0yfAwB3W17X12rBBHSI/5yvv0V86eN6Xps8Wt1O5j5Rxj8Jl+3GhQeoihhi8cl
         59CTrXqGass4r+TG221kXXGi3MZzvU48A+76ZeiCCHXy19DkEWSy2IDJAGwdf4bzHD2I
         BE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697148; x=1795301948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
        b=FsSpmy48Nf54rnqj5gw4HEPOYhJq6WIzfKselYR4CSzokiKpFM1emLet9/eH11BcQW
         ylK5J3x3u+5uQXQW/0SoLdHQjNWFRatMrSscHsJIjPc/88liDpwCFTo40N81YWGPIrWr
         oDacdWI7K3/a4xmlx0OwJGnfLcKja0aTK/NyhsiHl6aZ28IPhkEzRYfxH4Y1Lw18my0c
         9dMp3SKlEYwkWvQZvUHH7ebDehwEtjKsb7BQa23E1JBMMxdhlhB6q2TettQi8jX3OKyx
         9k/vEoSwYdbInsA4bZS6djjN8Ph7ihICfE+khsyHEAL4sav4qCnW3MCf5Tlsc+OtFc3z
         uKBQ==
X-Forwarded-Encrypted: i=1; AL+hErEGsO5wzFP7QlcRHlhd7w9yWlvLK0+zmT1dm1EVqpiefe/7baN1XK36C6dBEWj0UiUO4wqGGW4Qeh3xtJNHMQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PlfHE2sGJgnWiGFiuauc/r8fZQZeC0URt+s7Ju6mNyCv3slmy
	YAR1dWYmLYu9+PUMHLb2vSKk9x8JcySL3QlbNC24HzqwiZt+2CtSJK1OTZ11IIn4les29dqTfQE
	zXsAhR7Ii
X-Gm-Gg: AYBFou1I0OdKkvucyie5sf6Piavnm+ec24IiK6NjO134nBiVRuwMWD7Jyxd+kgt/9eb
	Npx1DUbWPdhA47506lL6QgRm/BygOPiTOsw9o8ryh3cVsizBhlZZmE2LlAFSpBW6B0z5lDwIjiq
	eO9X68xIDL5JevqQOMQ+E4Xf0oT/4idDlT5+4VVgmqHB12xeRuBz6WEl4pdLD/KBvzeg5URbscn
	X8eLBfyBusSWzhyL2eZGXTjWX8byqosOoJIHHeJvqlB6z31PEtSNYeAJOh9CP0ApXm7PsZfIeh1
	EQ6yAqFmWBbgBnjqxebDWADTIN2/yhl3ena7KQIbsA5hiXH28HIRt9D7rpUdUbh/wmsnwplqHTe
	FO2BzDrQpjwXEuwlPzXE0a58eZv9PJfMSR3ZJXwoT7Z1za4eJXLN9iFu/3x5PpG7FhKuiY1n7Rx
	9Bsu/9SiXQeUHd1XlxG5W4RcI1ENofQex16WqbAcqDRALo8b8dtouyYtjSwat/6iSQS7BvJf8O+
	mZBl0UXxPaQsGK2wNWafH6gbjy5Zn7D3Crho5g887STq3dfegO4Fww3bplfu7d8SRj+DhkCPeA1
	jCkLuYSqsj2Ljzq4oaJ5wFKmqzW29WIKrn285YEjI4nO/PAPb+5tc43OGvt+f2ZCZJVzVK6fgHM
	H9f2qYRrwtvJS14ZgARSIeuHPab79PvAWzktmUUSkKifDayPitc5wXgS0PUvruYaxONiaaikKpi
	rOInzPP4NjW+RPzbTSZCCLV+JxhUab7PeCL8ne7u0KeaB4BMiO2UfIOGy7VGp+eosWpxpTLu2Tx
	uN6j9U+kJ/6IvnqZNDyqqJsDRL3fv0wsjLZgcpcWDgVh1KgKIrbnzi1Yu5DNYN2t2SwhB5vuhOo
	D+0Z74MgIIUFsnak91VdZV3Ln/7/kL/wITLIcuDy9itcLiqGLQ54eA==
X-Received: by 2002:a17:906:c150:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c507c41ed34mr840249666b.23.1794697148201;
        Sat, 14 Nov 2026 14:59:08 -0800 (PST)
Received: from Desktop (p200300f24709e8000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4709:e800::a27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dafbasm2718936a12.22.2026.11.14.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:59:07 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sven Eckelmann <sven@narfation.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: [PATCH ath-next v2] wifi: ath11k: replace a pairwise key in place
Date: Sat, 14 Nov 2026 23:59:05 +0100
Message-ID: <20261114225905.978606-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mac80211 replaces an in-use PTK by calling set_key() with DISABLE_KEY
for the old key and SET_KEY for the new one, which ath11k sends to the
firmware as an install of cipher NONE followed by an install of the new
key. Commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
during rekey") stopped this clear-then-install sequence for group keys,
and the same sequence fails for a pairwise key. ath11k does not set
NL80211_EXT_FEATURE_CAN_REPLACE_PTK0, so mac80211 warns "Rekeying PTK
for STA ... but driver can't safely do that" and flushes the queues,
which waits ATH11K_FLUSH_TIMEOUT (5 s) for the whole radio whenever a
busy station keeps frames pending. On an IPQ8074 AP with a station
downloading at full rate and a rekey every 20 s, the first run of each of
two attempts logged 7 and 2 of these warnings and 2 and 1 flush timeouts,
and the station lost the link in both.

Keep the old pairwise key in the firmware when mac80211 disables it for
an authorized station, so that the following SET_KEY overwrites it in
place, as the group key path already does. Outside raw mode the hardware
encrypts a frame with the key it holds for the peer and generates the
PN, so a frame queued across the replace leaves with the old key or the
new one, and the SET_KEY resets the REO PN state. A pairwise key removed
without a replacement is cleared when the station leaves the authorized
state; a removal outside that state, as hostapd does for a leaving
station after closing its port, clears the key at once as before. A TKIP
fragment chain completed while the host holds no key for the peer is
dropped, as its MIC cannot be checked. With this, advertise
NL80211_EXT_FEATURE_CAN_REPLACE_PTK0 outside raw mode, where mac80211
assigns the PN itself.

Tested on an IPQ8074 AP with the same load: three runs with this patch
completed 3 to 4 handshakes each at 847, 828 and 851 Mbit/s, with no
warning and no flush timeout, and five station leave and re-association
cycles each cleared the key and completed the 4-way handshake on the
first attempt.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.

Changes in v2 (Sashiko review of v1):
- save the key length with the index and cipher, so the delayed removal does
  not send key_len 0, which the firmware ignores (len 16 in 3 of 3 runs now)
- delay the removal only while the station is authorized; a removal in any
  other state clears the key at once
- do not advertise NL80211_EXT_FEATURE_CAN_REPLACE_PTK0 in raw mode, where
  mac80211 assigns the PN
- drop a TKIP fragment chain completed while the host holds no key for the
  peer instead of dereferencing the missing key

v1: https://lore.kernel.org/all/20261107133925.3522299-1-julius@bairaktaris.de/

In the three rekey runs one softirq core carried 72-75 % of the load
(cpu3, cpu3, cpu1; /proc/stat tick accounting).

 drivers/net/wireless/ath/ath11k/core.h  |  9 ++++
 drivers/net/wireless/ath/ath11k/dp_rx.c |  4 ++
 drivers/net/wireless/ath/ath11k/mac.c   | 61 ++++++++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..f56fa9edcbfd 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -571,6 +571,15 @@ struct ath11k_sta {
 	bool use_4addr_set;
 	u16 tcl_metadata;
 
+	/* A pairwise key mac80211 removed but the firmware still holds,
+	 * cleared by the next SET_KEY or when the port closes.
+	 * Protected by ar->conf_mutex.
+	 */
+	bool ptk_clear_pending;
+	u8 ptk_clear_idx;
+	u8 ptk_clear_keylen;
+	u32 ptk_clear_cipher;
+
 	/* Protected with ar->data_lock */
 	enum ath11k_wmi_peer_ps_state peer_ps_state;
 	u64 ps_start_time;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..acdff945cd1d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3276,6 +3276,10 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 		key_idx = peer->mcast_keyidx;
 
 	key_conf = peer->keys[key_idx];
+	if (!key_conf) {
+		dev_kfree_skb_any(msdu);
+		return -ENOKEY;
+	}
 
 	data = msdu->data + head_len;
 	data_len = msdu->len - head_len - tail_len;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..42019e0641f9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4509,6 +4509,34 @@ static int ath11k_set_group_keys(struct ath11k_vif *arvif)
 	return first_errno;
 }
 
+static int ath11k_mac_clear_ptk(struct ath11k_vif *arvif,
+				struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ieee80211_key_conf key = {
+		.cipher = arsta->ptk_clear_cipher,
+		.keyidx = arsta->ptk_clear_idx,
+		.keylen = arsta->ptk_clear_keylen,
+		.flags = IEEE80211_KEY_FLAG_PAIRWISE,
+	};
+	int ret;
+
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	arsta->ptk_clear_pending = false;
+
+	ret = ath11k_install_key(arvif, &key, DISABLE_KEY, sta->addr,
+				 WMI_KEY_PAIRWISE);
+	if (!ret)
+		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, sta->addr,
+							 DISABLE_KEY, &key);
+	if (ret)
+		ath11k_warn(arvif->ar->ab, "failed to clear pairwise key of %pM: %d\n",
+			    sta->addr, ret);
+
+	return ret;
+}
+
 static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 				 struct ieee80211_key_conf *key)
@@ -4519,6 +4547,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	bool is_ap_with_no_sta;
+	bool keep_ptk;
 	const u8 *peer_addr;
 	int ret = 0;
 	u32 flags = 0;
@@ -4614,7 +4643,21 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
-	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+
+	/* The same firmware race hits a pairwise key: a clear followed by
+	 * an install of the same peer's key leaves the firmware dropping
+	 * every unicast frame to the peer. mac80211 replaces a PTK by
+	 * DISABLE_KEY on the old key and SET_KEY on the new one, so keep
+	 * the old key until the new one overwrites it in place. Frames
+	 * queued in the hardware leave with the old key or the new one.
+	 * Only an authorized station gets a rekey, and a removal not
+	 * followed by an install is completed when its port closes.
+	 */
+	keep_ptk = sta && flags == WMI_KEY_PAIRWISE && cmd == DISABLE_KEY &&
+		   peer->is_authorized;
+
+	if (!keep_ptk &&
+	    (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta)) {
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
@@ -4656,6 +4699,13 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (sta) {
 		arsta = ath11k_sta_to_arsta(sta);
 
+		if (flags == WMI_KEY_PAIRWISE) {
+			arsta->ptk_clear_pending = keep_ptk;
+			arsta->ptk_clear_idx = key->keyidx;
+			arsta->ptk_clear_keylen = key->keylen;
+			arsta->ptk_clear_cipher = key->cipher;
+		}
+
 		switch (key->cipher) {
 		case WLAN_CIPHER_SUITE_TKIP:
 		case WLAN_CIPHER_SUITE_CCMP:
@@ -10056,6 +10106,9 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
+		if (arsta->ptk_clear_pending)
+			ath11k_mac_clear_ptk(arvif, sta);
+
 		spin_lock_bh(&ar->ab->base_lock);
 
 		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
@@ -10606,6 +10659,12 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	/* In raw mode mac80211 assigns the PN, which the hardware must not
+	 * encrypt with a newer key
+	 */
+	if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
+		wiphy_ext_feature_set(ar->hw->wiphy,
+				      NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
 		wiphy_ext_feature_set(ar->hw->wiphy,

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


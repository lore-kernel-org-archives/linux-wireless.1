Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058767;
	b=XQDVrn3/tAKWnaS7uYKihSUBS4vcA0fK4g/NdKcEAc3GYRPMmKHqKxcT+KvUMpqS5l8Z
	 EQhu9/QWMzv79eY3DWZlFsU+T8rdnaJuZ+4pByB1iQCNXDStKomaKqz1D7kf4GN+jNSuo
	 ekBe0Wz3+mNFVSj8m3bMxYA9QkFG7KtBM4+HkQIj5f31X1DbVOzsKPtiOVg/xKdCEDndQ
	 oQSx6+iYlLdx86EnSCdnChybbgX2lCk1690MZjDTBg2exBXI1ON8xF8ingv5qRpeeKqzY
	 0TcBK3PdktWTlSQ7i4Vx9i4u6Jl6EfUfxosorWbuNi7gQZ5Bd4RRIeN4hDcfz3jYFxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
	b=4tuV8FTkCmEfMjwHmTxnKBfizxuA5Gn9z5j75WINJ9WDvDAvUBjOXQ2wFZ4MGwct2mOm
	 r3uNfLEUKqjzP0VqczP25KQsZjNHtrzpPvxvyOVD/Pjoeos5O3Cw8eZYMmQhNGdoegMem
	 tibMw+3rtPT7ZLHb9Neh2lCL4jsCe9qRggGJCrO15KqjZyC4+tkHZpcTDvSAn/JxXHbTF
	 60SDhlNcwXmizhnxc4qqf2uv8fmERL1mEV+N2ujoJUSZ6IOUjGTMvr13aH7VTBDQWPii4
	 qvuHll04offbk7qpkrEt0YU7XG9h+g2y139JRxCa1cHpqqqGEwNI6TY+hwSPbmHUuzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xdTjjITC;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C347606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 13:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C347606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xdTjjITC
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c49b431f022so222775166b.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794058765; x=1794663565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
        b=xdTjjITC6uUAK2uZxG4/Z3iWhfeed0+Cz8NpRqPW2zaY+vJXI8RCP6dPu+W5eB2i8H
         0LKj3s7Qa/l9ByrWhJ6dbEMDWzjEmA327Wixh0wkF0VXhtHk2hDDmed7M/gOk2JYfvYE
         ot+9GUiW3WZtoFqCPCziJFfZBa6rl5skHROza6qlyLWltCq0/O3YsSF2UIO1uMW8m+eM
         OXY/tberDq+yx+j31NX5RAHGwmsI6LKFRENIo2VhzpXIZr/ceWDoM3dE0hGQWmERJEyQ
         Su1Q6h1KfSiJDHif/r3hA4KnvMkRnXx0jX4Koo4u0joR6W6UTBH3CvfL18TE9KjU1S5d
         6FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058765; x=1794663565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
        b=m1ACnstMmNlfh859g8xGHSG5QxrDAQc7ZOqTQ5BGiZhLqUpZWl0IxLC8SUDo7Jbf7n
         wm2L9Mmzm70NaR7FUuHnupObNqPcgeYGV83H9t66e1rxuYDAvkzqOgum7iTye8ifbi9e
         HkF4H3MTt07xTc8hEeY6WMHrZ4WaJJ3ejvqfno/FMW5y0zgogHO9Ozj/2aYIrE3TLkum
         GciTG8sHZWAoQQ79NmKywsOnXU1/nyV/VkUV3hyhvnnlTGjH2C7hz+TVeikPc6VgA5v7
         DXYS5NPJ5lsViHPVW4CHzD0Iza+Ex1nv5TIGSp1LwCzn8a+CJQjSgbBagsPizarK1cst
         29gw==
X-Forwarded-Encrypted: i=1; AKwUvByAQR8wUGVdO2DfZGyTbAKQoR63O2WuJC3pHyHQlsDntu73coqX6gX+1cU+HxA08tOgU2yU7oqfkHbbGIDJaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MucTfgq3nBwbvjjrvNiwNqP7lPlj54rkrW/eySaijzckM6KnN
	jUEq6UYzaWkP22Gcx8Iy+cBSK9n56LbKVQ6DADl4WCJnVo45SFB5hHHpM0sMwGqkDBcsl3AjcNv
	6JifVNFo0
X-Gm-Gg: AYBFou0cdTgk2lcaZc/fVKdJgUbcNINDUwHdo0+VF1RWTnqxv9K594IknZigauizzyi
	JFvYKMrtqeSeStC73Mkk/o0iYhFE+FnTfn17SoL0rsMfH+6jwLyUxB3IxN5gRT32SSWhy3QpagV
	590OtXduKQPZRnNUypxlmsoPSDHhVtqXN4QR9ccRLKm/AMbq4MDGWls8cPwb+EtAr3EI0N4LKK1
	dnm3GIog7AGu6K6Rq40WTG1QrmjMm6eFIIrxLzQDvKr5tzc1pH+c//W4psgBU7bU6xoTunaMNod
	4lTrJ7o2t9LsXvhirEKWb9ikGpOJH1Z02owFVvWuhDSLPY0Y3MsX2u6obKHr/cIznsbfufSUFmm
	VNXP4Eeze9vdA+qs9MW3BL7nMieuhWEEntRyAQQyWIk2lJMMyRzL59Lsf6nVnFlLYLeGODqZvI/
	w929fIb+XBZYYPcV1PLUXFq1zWIYbWHm+TrpurulHvtGuMv/sDQ400eu26e914dqOOABG/xbGZz
	37HggsThItoiSdFiBUcTdQaqbiCr/Hhs4i1LGvKp8OS1pypofgNx7vzKISrGs+rVNHhLjRGg2YL
	8+SshnlbPeff6tJAw9LE5T4pj8nd2qLr/UvhUXxXLEYCFahvsNT9VFVKtAbuMthBWlSzI8MiWSB
	S9ZG3cj2uQUX5DAZYEiWeXOrNGKMsBgRw91sPMAvt1QvTU3WakChg11XX2F9WH559HOY4K/qVWq
	EBTey8zyaVY7fwsGRE7xpvtKbM5v1TuGM3PnMZ1cyc6tfJkNQMbbHz6pOwuullxsGRB/OR3S48A
	zVjlg0oWekiDvHgBPoIgi1CiBT10l23u5RPk27q1gCvBrr++9+tMh7LT1AH4SO9sbs1DgGg/l8L
	bsNLrM2e14OinVB0qw==
X-Received: by 2002:a17:906:ef04:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c4d3468f9f2mr431978766b.7.1794058764366;
        Sat, 07 Nov 2026 05:39:24 -0800 (PST)
Received: from Desktop (pd95130be.dip0.t-ipconnect.de. [217.81.48.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ab149sm151758266b.3.2026.11.07.05.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:39:23 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sven Eckelmann <sven@narfation.org>
Subject: [PATCH ath-next] wifi: ath11k: replace a pairwise key in place
Date: Sat,  7 Nov 2026 14:39:25 +0100
Message-ID: <20261107133925.3522299-1-julius@bairaktaris.de>
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
and it fails the same way for a pairwise key: on an IPQ8074 AP, the
station stopped receiving at its first PTK rekey in 6 of 6 runs, with a
Broadcom and a Qualcomm client, the REO counted up to 165 PN check
failures per run, and hostapd deauthenticated the station at the next
rekey. Because ath11k does not set NL80211_EXT_FEATURE_CAN_REPLACE_PTK0,
mac80211 also warns "Rekeying PTK for STA ... but driver can't safely do
that" and flushes the queues, which waits ATH11K_FLUSH_TIMEOUT (5 s) for
the whole radio whenever a busy station keeps frames pending.

Keep the old pairwise key in the firmware when mac80211 disables it for
a station, so that the following SET_KEY overwrites it in place, as the
group key path already does. Outside raw mode the hardware encrypts a
frame with the key it holds for the peer and generates the PN, so a
frame queued across the replace leaves with the old key or the new one
and never in the clear, and the SET_KEY resets the REO PN state. A
pairwise key removed without a replacement is cleared when the station
leaves the authorized state, and peer deletion drops it with the peer.
With this, advertise NL80211_EXT_FEATURE_CAN_REPLACE_PTK0.

With hostapd rekeying the PTK every 20 s, a download to a FastConnect
7800 station holds 914 to 945 Mbit/s through four rekeys, with no
second below 854 Mbit/s (3 runs); before, the station lost the
connection in 3 of 3 runs.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write this patch.

 drivers/net/wireless/ath/ath11k/core.h |  8 ++++
 drivers/net/wireless/ath/ath11k/mac.c  | 55 +++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..69e612a3e71b3 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -571,6 +571,14 @@ struct ath11k_sta {
 	bool use_4addr_set;
 	u16 tcl_metadata;
 
+	/* A pairwise key mac80211 removed but the firmware still holds,
+	 * cleared by the next SET_KEY or when the port closes.
+	 * Protected by ar->conf_mutex.
+	 */
+	bool ptk_clear_pending;
+	u8 ptk_clear_idx;
+	u32 ptk_clear_cipher;
+
 	/* Protected with ar->data_lock */
 	enum ath11k_wmi_peer_ps_state peer_ps_state;
 	u64 ps_start_time;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..386e9593e4590 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4509,6 +4509,33 @@ static int ath11k_set_group_keys(struct ath11k_vif *arvif)
 	return first_errno;
 }
 
+static int ath11k_mac_clear_ptk(struct ath11k_vif *arvif,
+				struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ieee80211_key_conf key = {
+		.cipher = arsta->ptk_clear_cipher,
+		.keyidx = arsta->ptk_clear_idx,
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
@@ -4519,6 +4546,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	bool is_ap_with_no_sta;
+	bool keep_ptk;
 	const u8 *peer_addr;
 	int ret = 0;
 	u32 flags = 0;
@@ -4614,7 +4642,21 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
-	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+
+	/* The same firmware race hits a pairwise key: a clear followed by
+	 * an install of the same peer's key leaves the firmware dropping
+	 * every unicast frame to the peer. mac80211 replaces a PTK by
+	 * DISABLE_KEY on the old key and SET_KEY on the new one, so keep
+	 * the old key until the new one overwrites it in place. Frames
+	 * queued in the hardware leave with the old key or the new one,
+	 * never in the clear. A removal not followed by an install is
+	 * completed when the port closes, and peer deletion drops the
+	 * key with the peer.
+	 */
+	keep_ptk = sta && flags == WMI_KEY_PAIRWISE && cmd == DISABLE_KEY;
+
+	if (!keep_ptk &&
+	    (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta)) {
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
@@ -4656,6 +4698,12 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (sta) {
 		arsta = ath11k_sta_to_arsta(sta);
 
+		if (flags == WMI_KEY_PAIRWISE) {
+			arsta->ptk_clear_pending = keep_ptk;
+			arsta->ptk_clear_idx = key->keyidx;
+			arsta->ptk_clear_cipher = key->cipher;
+		}
+
 		switch (key->cipher) {
 		case WLAN_CIPHER_SUITE_TKIP:
 		case WLAN_CIPHER_SUITE_CCMP:
@@ -10056,6 +10104,9 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
+		if (arsta->ptk_clear_pending)
+			ath11k_mac_clear_ptk(arvif, sta);
+
 		spin_lock_bh(&ar->ab->base_lock);
 
 		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
@@ -10606,6 +10657,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
 		wiphy_ext_feature_set(ar->hw->wiphy,

base-commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5
-- 
2.53.0


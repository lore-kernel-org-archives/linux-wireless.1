Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184286;
	b=V6BBMF6HPn2cqop/y8uLEftzEUwEoJs/KNWOZxXpO6wmhKfScRvrBdbPvxyTOdOJZIgK
	 +0aro9hLfCLFB+CD16fjuuGj5uPltROP12UT3eIK8dXzEnERXyDjSLLkfTGMC1h5ZD0/z
	 0gEsmRjZ6ZoH5Epug9hxiL5YdsvXnwNaKC3qe9Zdy4UEvMju/VCklbCaKZJ/fVKcp+N/M
	 YW/JJlj+zTEMFJuOxPzZ+kl2OGI4Ahyb8MwiKCmgcp+2cfnibwMKFvFh6vftaBZ7lYSBX
	 3XwjvafxK+v/a3s7t+JWakxTm8UVY2smR03KpRt253/ix9lEUPC7VMWhrRt97R4lw1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184286;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=FAu3bJU16zVGEe6ATAznKEdcW/0je1mo3cX5A98w6yk=;
	b=Q7RwD953OIQbI6ztFpifGoRuCMwEyFQQLzsqZLThnZjmskd16gdEnuAA20E/HHLLj6PH
	 /jra6kPW3ihqM40cX5CB03m2ZvsbXAF4VU6H7KihnPrFyh7Fdze6CaY3Xu+5/fdSEH6h5
	 FHi2pFtuTuDawt1RaQZpDFw9+MPCK994SoAmkd7CNueuI9V+Vn3OvHTUIjdGUKmzEhmc1
	 uHuqG7XqBY3NKVgcJIQlITc6Bgjb+vjesLyNnOmH4jZKu38+sLHtOAjcema1psM8K/1ZF
	 FppAPxSmiA/3NNuYowSrFnIwpd0q6o1zpaGld1jMmeZ6qP6jYJASkfhzX4e3rIzFRXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=c3bgAfNN;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3995606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 00:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3995606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=c3bgAfNN
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A581D80489;
	Mon, 09 Nov 2026 01:31:23 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxAYgGdismVw; Mon,  9 Nov 2026 01:31:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1794184282; bh=BJMMuXmGJnl5ckM2ekGCnT0bU5WA/JILtvszOtKRv7s=;
	h=From:To:Cc:Subject:Date;
	b=c3bgAfNNzNqYettoAVyCu0/mm+l30zAdD0HFhd13wpRCZ7vOO6HKdYQTfE7MSYF0Y
	 LgeHj/z7XHTZnbFEN8jdqCaPyo7rEBNVg2Y+9gn5+QDVEt1s4eyOesA/+xPNCngQX9
	 qB1WEngMsawcueLCBNyzGdWlw8s5OTH+L3dPYpa3ay/3j4WXQRzrHoAvN3iTxN/3R2
	 mcKwJj7UXYXOIiMDSmyAowoK6QaYskXf+6dn2t7c+/KvCm7mUWO0w1W1s9hmCgyr1X
	 GdKdVBdcKJU/cb23DnpYpu+oYUEZLXoB2ZbUMQ9l0GCFFz3UqGw79Ybif5wWbK3x/E
	 p1AXIyPizMDBg==
From: Florian Maurer <fmaurer@disroot.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Florian Maurer <fmaurer@disroot.org>,
	linux-wireless@vger.kernel.org,
	Simon Schippers <simon.schippers@tu-dortmund.de>
Subject: [PATCH wireless-next] wifi: mac80211: mesh: tear down BA sessions when the peer link goes down
Date: Mon,  9 Nov 2026 00:30:46 +0000
Message-ID: <20261109003048.3580346-1-fmaurer@disroot.org>
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

When a mesh peer link leaves ESTAB, only the plink state changes. The
station entry and its block ack sessions stay until the station expires
after mesh_plink_timeout (default 30 minutes). If the peer sets up the
link again from scratch in the meantime, e.g. because it rejoined the
mesh or restarted, its sequence numbers start from 0 again, but the old
RX reorder session is still there, with its window head ahead of them.
Frames on that TID are dropped as old until the peer's sequence numbers
pass the old head, up to 2047 frames.

A restarted peer does not need to close the link first: its OPENs carry
a new link ID and are ignored (OPN_IGNR) until it gives up after
dot11MeshMaxRetries and sends a CLOSE, which is accepted in ESTAB.

A new ADDBA from the peer does not help: the first session of a new
station uses dialog token 1 again, so it is taken as an update of the
old session ("updated AddBA Req") and the reorder state is kept, and a
peer that rejoins without HT sends no ADDBA at all. The TX sessions for
the peer go stale the same way.

Seen with mac80211_hwsim and on hardware with ath11k and mt7915 on the
node that kept the station (the keeper below). After a neighbour
rebooted, an ath11k node dropped its frames on one TID for 4.5 to over
20 minutes. Deleting the station on the keeper restores traffic at
once.

Tear down the BA sessions of the peer whenever its plink leaves ESTAB,
as is done when the station is destroyed:
 - in mesh_process_plink_frame() when the kernel MPM FSM left ESTAB,
   without DELBA since the peer has closed the link, and outside of the
   RCU section since this can sleep (the wiphy mutex keeps sta alive),
 - in mesh_plink_block() and in sta_apply_mesh_params() when user space
   moves the plink out of ESTAB, with DELBA since the peer may still be
   in ESTAB. These keep the sessions consistent with the plink state;
   no failure was observed on these paths.

ath11k keeps the old window head in its REO queue on RX_STOP and needs
"wifi: ath11k: invalidate the REO queue SSN when RX aggregation stops"
as well.

Fixes: ae2772b313b9 ("mac80211: allow frame aggregation for mesh")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Tested with mac80211_hwsim (KASAN, lockdep) on wireless-next
b8e5b0ae8ff4: two radios, open mesh, kernel MPM, ping both ways after
every re-peering. Leave and rejoin, restart while out of range, rejoin
without HT and station expiry while isolated: >5% loss in 81 of 83
cycles before (mean 78-100%), in none after, with and without mlo=1.
Block/open: 1 of 20 cycles before, none after. SAE (wpa_supplicant):
no loss before or after. No lockdep/KASAN splats; the mlo=1 pass has
the same hwsim rate WARNs with and without this patch. A short
stand-alone reproducer (hwsim, leave and rejoin, a minute or two): [2]

Hardware (OpenWrt, 6.12 kernel, open 802.11s mesh):
 - mt7915 keeper: >= 40 s outage in 5/6 runs before, 0/7 after.
 - ath11k keeper: still dropped in the REO queue with this patch alone
   (0/50 replies in the first 50 s); with the ath11k patch 48-49/50,
   and the reboot stall gone (3/3 reboots before, 0/2 after).
 - ath10k-ct keeper: the firmware handled the ADDBAs, no outage to fix.

This might also be what Simon saw with ath10k after a link came back
into range [1], if one side's station had expired meanwhile.

[1] https://lore.kernel.org/linux-wireless/20260202133532.814017-1-simon.schippers@tu-dortmund.de/
[2] https://gist.github.com/maurerle/fb8f26aed07b587cd653adcd1ba0a67e

 net/mac80211/cfg.c        |  5 ++++-
 net/mac80211/mesh_plink.c | 13 +++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 6e466f8e1653..1ef96a668d46 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2469,8 +2469,11 @@ static void sta_apply_mesh_params(struct ieee80211_local *local,
 		case NL80211_PLINK_OPN_RCVD:
 		case NL80211_PLINK_CNF_RCVD:
 		case NL80211_PLINK_HOLDING:
-			if (sta->mesh->plink_state == NL80211_PLINK_ESTAB)
+			if (sta->mesh->plink_state == NL80211_PLINK_ESTAB) {
 				changed = mesh_plink_dec_estab_count(sdata);
+				ieee80211_sta_tear_down_BA_sessions(sta,
+								    AGG_STOP_LOCAL_REQUEST);
+			}
 			sta->mesh->plink_state = params->plink_state;
 
 			ieee80211_mps_sta_status_update(sta);
diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index 6ce3ae3fb39b..80993f31f239 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -825,6 +825,7 @@ u64 mesh_plink_block(struct sta_info *sta)
 	sta->mesh->plink_state = NL80211_PLINK_BLOCKED;
 	spin_unlock_bh(&sta->mesh->plink_lock);
 	mesh_path_flush_by_nexthop(sta);
+	ieee80211_sta_tear_down_BA_sessions(sta, AGG_STOP_LOCAL_REQUEST);
 
 	return changed;
 }
@@ -1131,6 +1132,7 @@ mesh_process_plink_frame(struct ieee80211_sub_if_data *sdata,
 	u64 changed = 0;
 	u8 ie_len = elems->peering_len;
 	u16 plid, llid = 0;
+	bool was_estab, teardown_ba = false;
 
 	if (!elems->peering) {
 		mpl_dbg(sdata,
@@ -1211,11 +1213,22 @@ mesh_process_plink_frame(struct ieee80211_sub_if_data *sdata,
 		sta->mesh->aid = get_unaligned_le16(PLINK_CNF_AID(mgmt));
 	}
 
+	was_estab = sta->mesh->plink_state == NL80211_PLINK_ESTAB;
 	changed |= mesh_plink_fsm(sdata, sta, event);
+	teardown_ba = was_estab &&
+		      sta->mesh->plink_state != NL80211_PLINK_ESTAB;
 
 unlock_rcu:
 	rcu_read_unlock();
 
+	/* The peer link is gone and will be set up from scratch, so must
+	 * the BA sessions: the peer has typically lost its side of them,
+	 * e.g. when it restarted. This can sleep, so do it outside the RCU
+	 * section, the wiphy mutex keeps sta alive.
+	 */
+	if (teardown_ba)
+		ieee80211_sta_tear_down_BA_sessions(sta, AGG_STOP_PEER_REQUEST);
+
 	if (changed)
 		ieee80211_mbss_info_change_notify(sdata, changed);
 }

base-commit: b8e5b0ae8ff47240366d38e5d12c65f878724316
-- 
2.47.3


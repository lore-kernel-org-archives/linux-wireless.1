Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184744;
	b=1i5Ua5plDnknmM4JmbJqUT57AWRXUI1kBfRNJwfuFphja5qmylJhAMhjtAoR63ehijOJ
	 FBcdLkrYRn9Z13lPNk83qzUJLNSBPHtfQQCEuwTliyFNvNBCeZT8UpYWvFt/yPrcqJHU9
	 5wL9Yuq6wBQ8sDHvuyJZDgekfYu/yYcmNU2NuC5iswUvRb3neen1pdxPMYOr0o8LZYGxM
	 mOoFl/pzo+CKkNFpLK4zQfHl22/Kg4NDXDr/1+eAzE6LTgKcEyK/i6CzpioLCLWPPm08/
	 RhemOmowj99d34aEyXNFO9dZ8Lbf2Qa6fvHHfJX8znQvwdYz56glrCl+s86VHBRmJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184744;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=Mjlh4r2cr70Fp9O2WlzoUu5qq7qdV4PArKjEo2YuJiQ=;
	b=mFNbCmBWSpFbBioxNsLlgUEQOdAn18EzgpM0SiPqgQbmhhpAooC8FGxgriZqABnD6zFX
	 g0CKper1iuliftLtuNW0G0ncMwPgbjXfBvCbrlNm+bsLcPAPMX9Tg71FiAyNE+aUv/tpw
	 bfNcS++kqmgTvaYiOEhtnb/Ji+/Z3GLyNNR8VMGWMNFbEohHehoO+07wTAXCzl9BpiOcR
	 RERW6yiGmthb4lATE3zZd506EUv5klGeFrE1eT7jtNkg8vGILMiTOLPVvYMZMsjkcsGO+
	 0jFiMJXDfRGcyfHXvjXLJ60KMWEjsuCRatS9Ta1C1SlzJdapvzxG0cxdDJ2+iJ7NtMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=lrHdZtN9;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63B606A326
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 14:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A63B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=lrHdZtN9
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 86980804BF;
	Fri, 20 Nov 2026 15:25:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4Ky1898eT5Z; Fri, 20 Nov 2026 15:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795184740; bh=E+62AiIQ986eOGr5hiCWRhohiO2hF7n1p2yN1mg+DX4=;
	h=From:To:Cc:Subject:Date;
	b=lrHdZtN9Jq2wG+sXfzsX5UwmVaomykE1vgV6B8mheTuMtN9cs8OqDn8mj2+JGD/6L
	 R+cVSZAVcdqN+LR/KP4A7jMNmvOAdeDXs2Avp1wkgLxaw8ATtMXmnazvKx7BRPcpML
	 i+g9Z11QdbcC4uqemib4rI8QEz5i6MCjyyJAtbH6jh4ALzjXvrcd4Q9Gl8umsYzqM/
	 +7miKTSfAlUVHCNrOiJ27tnuw+tLfmOEJihCgNVsb3bSNslYN9rrcrgK5L5M0L4xho
	 dWHvN15POa7xHsueHEVJHGBeYhO/2dYUb/4/pCdLpEaMDzWKlCJC201jNMyOPYQsmf
	 sZ3SdgeE8Knwg==
From: Florian Maurer <fmaurer@disroot.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Florian Maurer <fmaurer@disroot.org>,
	linux-wireless@vger.kernel.org,
	Simon Schippers <simon.schippers@tu-dortmund.de>
Subject: [PATCH RESEND wireless-next] wifi: mac80211: mesh: tear down BA sessions when the peer link goes down
Date: Fri, 20 Nov 2026 14:25:14 +0000
Message-ID: <20261120142515.463101-1-fmaurer@disroot.org>
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
Resent unchanged: the original from 2026-11-09 [0] reached the list but
not patchwork.

[0] https://lore.kernel.org/linux-wireless/20261109003048.3580346-1-fmaurer@disroot.org/

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


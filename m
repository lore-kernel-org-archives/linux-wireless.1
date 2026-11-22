Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360095;
	b=wWkR7PQMvcV13PJ/0Pq5er9q1JHy7cJk7H3B3dqo6QrcPGir4NLkFGfudfVDxORUvbxq
	 0OFY5bkmPZhbI1SBL6afJX31Q8h+XkEuHdb/pOcKk26CmNLdxAV0S+AFOy8HAJm1mwwPh
	 BsWp37meiawBnNy2lRzOIMcBV2HLDzwL8DGkuLUbNMtZZ6MUwhlQ3DKwGCg/WGFvrz+tG
	 zsNBQtSLgHSctQL7g1mDxSS99p95trDij5bUoxjsxtpKqI67ejKxWMx9BiRHn2jwZjvlE
	 Ga/s3us35X+zm5wu/BZpvaY9UyLnCzDBUrB1w1JhNYDVvNPLgigDZYO6qnHYun+xZlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
	b=rm+kahXmTTgjqN0HbhhX6MnlRQveygKI11+Afw86kS1TkXY8lQa5mCQXO9ehEaB3hEvf
	 W3tqvTr0hsMgpBTU0KrL6CK3UuHsZ53txSL+QPntVilGMvEM+OhObuge5NHuSAquOBu27
	 X/nr9CCGU8odGJy86C974q9aNohOmEjkj9XzEQ1dUfL5grJb5JrUep2E/i5vfshpOcW4g
	 7E1kXmbIow2WwpLm9jvEjI0sHfckMs6Cy4OqEFcwJZbk2eVcNweY6Y0d5tJa3mDy/YdvS
	 LtTlrWo0T3J2tKCTrn0SsjuaJ9Z4dlowo7nRNU/n7rXz9H/1PdTfiJQ+48sxW2FMCtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=un7UH8aJ;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853BE606A690
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 15:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853BE606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=un7UH8aJ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a160d24so64976666b.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360094; x=1795964894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
        b=un7UH8aJukSK+gfTizYDoiUz4CMM0wzYjdMrFag1Qn+EdK6k5cr5T+beuNWTgILxM8
         TmoXCOYKYrW55JwNOSPLYJkVDIpy7zKdmu00qWG5QyQxMUcrBwYwhdtVtMUPoS/qFObb
         Z3/hUSIuBl6O3kWCXsiL5+wjSdrC322yCAANqJba9tB6Jd+QhPDFDZO5dICfmUlyPbf2
         eweRelqUJtB3mw9W41AFDbEGU99UzmFyD3wXQZjaUpMh40xkuO0faBGE9e4Ov3oUYJcI
         VL+NU3WFIS5w14FykUitHeoTRX26bQVnH3EGA2DOgWJIJFUc1yVgGRrb6QSVC0jPknHX
         58+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360094; x=1795964894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
        b=uZH6RME1WVgqTuauuO1/VvJNKfv3pqvtBKs/6JMtsegDuOPquqIWsUQGhaXkaAI0jo
         7+B0LeGsew2FJnpff8hvcjL2XSvbdA3MjOQb+hA8hQDtrqS1PhsBcKgdAKky3nywFvaS
         M4U0fPhwoNeP/3H9dwrK/mhrzXDU404MZlEJHDHrWBUaNN69lq25HH5b6/PfpbiFnQwj
         2AhH2JcHlOMQM2/hnz8N/KC2kT/eIEHMUy2V35WQzB7RP4jj58SlEpqwK3IE8Y72gTTm
         CdnWd6sdI1ttkBtgtUuDcUm1mQFO00Pg+pdyzoAFP6TntYGDGqUdGLDVFu1n8K9c6iyw
         PagQ==
X-Forwarded-Encrypted: i=1; AL+hErEfr59Dj+m9wNJxPD56pM5Cyhn8jfj/O10mnGBJ0/Jpgj94tks29vm3zSuHY1xqSdtKBnTqBSG9KI/1VkBOKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4aDbSlGsznDlWZ2dAuYCLYpzRBWZT5EsKOqqMWxzZuVL3/Vwt
	tf2yrf69H0bZ0KmxamWvpPSw3T3mqZ35SnircFvNx3BjhoNi8+5Sjo7/MTg63HhhEAJnhyl0jGg
	AAORp0kl4
X-Gm-Gg: AZFdTZdf5HuVvA3BJWDxtdV+eW8oT9O05MaSzecxZvgY7g/Q1o+kCHo4wbCTUVzy+SX
	1bU/M4Rr6z3VpycXu7ROMcLb0p8ykQSuWfhJPEDzXDPnQWZLbjmCNstbzyXhV33Pkk1eqvBYwxL
	TplcFOrx5Ukh9W//27v7JEeYA9Uak6y++G64YjJcObw9xgBK2DpErOrMVbTEcQPZeuxAUk1iG46
	WEOD+lVjW5gYP9NA8ZaaRIyDhdctnJ/uz32OX5YmTLw48Z5ClHibpMxOAu59A4eczK3GmNZKIaV
	fKwhYcrPP6FsOxpGaXR7IGlpI7m+amyPWtYea85FSQPj9AvlKo33DCKLeeuLxFnVpp6bHSQcYy2
	4GSWbywPL8MhCdWJbaOC/yNIamPrIjd4vncB0sLQcIwh3nE90SMFEic07Z0I4FVR4tVRbwjBHwK
	rnbpWR4dgt3bisdg1SWKLltyeS6RGZ7eeKklabQDJ2jPTX3WmAGP+MPpieGxqK5zXLD6MUzLU7g
	hI+hNpLxHieL8P7UIn7LIXISsWuuTZrmNgUvxUbbRzSjdSEDuu0eyck5KNwwqmq/bl9Z02toYXc
	qL/sLZR1dOLctmcChNloa+/mexkcrN+k2UH1QXY/7X6iS2L1fL8atoK5W8KPX9HK8xBs/OR3h9u
	HoH5buIGAUWRAx4AzRuK5LgxovPk/910QodyPsSlzlh47e8Vi1Z2y23OVdeyRJH3bm8PuUp89LP
	QhliIkSxAlL9d8wEG5btYNMtrqm0V8MjvaEDa/DGhdZq/I5bnbZ1XsYy6Ukx0gIIK44xA5hzXWo
	0qEvzrNYqHHG5t3SNZC8K4xtroJfk+hyiPylXFIkgrg7QXgY9jr+PO7OwqoM0vEnpsI4uJvk8ka
	jpSKxgX6ek4k
X-Received: by 2002:a17:907:ea5:b0:c3f:8c92:3b5a with SMTP id a640c23a62f3a-c513a88aa78mr749156266b.12.1795360093814;
        Sun, 22 Nov 2026 07:08:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:12 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 2/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sun, 22 Nov 2026 16:08:11 +0100
Message-ID: <20261122150811.3135445-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122150811.3135445-1-julius@bairaktaris.de>
References: <20261122150811.3135445-1-julius@bairaktaris.de>
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

mac80211 requires sta_state to succeed for down transitions and warns
when the driver returns an error for one. ath11k returns the result of
WMI commands for ASSOC -> AUTH and NONE -> NOTEXIST, and these fail
with -ESHUTDOWN while the firmware is down. A station removed during a
firmware crash then triggers, for the disassociation:

  Driver is not allowed to fail if the sta_state is transitioning down the list: -108
  WARNING: CPU: 1 PID: 5952 at net/mac80211/sta_info.c:1561 ieee80211_sta_eosp+0x119c/0x1668 [mac80211]

and for the removal:

  WARNING: CPU: 2 PID: 2080 at net/mac80211/sta_info.c:1652 sta_set_sinfo+0x1118/0x1144 [mac80211]
  Call trace:
   sta_set_sinfo+0x1118/0x1144 [mac80211] (P)
   sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
   ieee80211_del_station+0x1c/0x54 [mac80211]
   nl80211_del_station+0xf4/0x174 [cfg80211]

Two of these failures also skip host cleanup. On a non-AP vdev of a
device with vdev_start_delay, a failed early vdev stop returns from
ath11k_mac_station_remove() before the DP peer cleanup and the station
accounting, and ath11k_mac_op_sta_state() then frees the peer with its
rx_tid state still in place. For a non-WME station, a failed RTS/CTS
update returns from ath11k_station_disassoc() before the peer keys are
cleared.

Warn and carry on with the host cleanup in both, and return success for
every down transition.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v3: none.

Changes in v2: continue the host cleanup after a failed early vdev stop and a
failed RTS/CTS update instead of returning from them.

 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 48795c72d2982..b87b15492a8fd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4987,9 +4987,7 @@ static int ath11k_station_disassoc(struct ath11k *ar,
 
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
-		ret = ath11k_recalc_rtscts_prot(arvif);
-		if (ret)
-			return ret;
+		ath11k_recalc_rtscts_prot(arvif);
 	}
 
 	ret = ath11k_clear_peer_keys(arvif, sta->addr);
@@ -9925,10 +9923,8 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 	    arvif->is_started &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
 		ret = ath11k_mac_stop_vdev_early(ar->hw, vif);
-		if (ret) {
+		if (ret)
 			ath11k_warn(ab, "failed to do early vdev stop: %d\n", ret);
-			return ret;
-		}
 	}
 
 	ath11k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
@@ -10082,6 +10078,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr);
 	}
 
+	/* mac80211 does not let a down transition fail */
+	if (new_state < old_state)
+		ret = 0;
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.53.0


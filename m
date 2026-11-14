Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697011;
	b=txqwLD6d2y5/J61E5zsnOFS06eg5HHOaD4oaBl1IIoRasVBHJKfclYoxgqMZIYwUf3pA
	 hW9A6L2yL4969Ozc4mKtCLSSRbgYbfEmf1M01cncOyFkqxDfP4StNCHSMENIs74rGkvLX
	 Ccz6RKIx5khrfmHi4X0UkDPaHBHV/M3mNRoVJPItJtEq0S7T3VIY1AjGtp4i3WnvfEp2g
	 ssSKVloVIrnKjslaj3vUkz7AF8rWQGNvr6lzUv8yAhyXXOR/zStr0Za+9jDAh2pax0TTG
	 GXjD+Yu36QlBWdsDhNo4+jspIOUjG6wa0SAic31bjzz2hPqfc8za/Ad6uqGummhMyFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
	b=H6ELLtzq4H/vCFNlQOcyhOcdeBwMWOgk6LyIA7Do8pINSEtzccaSifmMhhhKucRYHk0g
	 GNbtUYiVjZRgU4qBX2E54X8lIL3MZ3a+S7bVBOzWqeO0GmSgVYAVlbANK/eQVg6JZ68VA
	 MJnSVGMiUCrhZeoblP9VOYrXw+U4NO2mN6f9+7CxiQSkUdsrWlVrkOUj3b5pEI03RQRnn
	 oDgWZ2g3IAQ/IKSnTupnofRoYQXXrIqKFqIxaRr/VKUW2GWX7PqA6jBr2eWHqZaxCENK9
	 Nd/SZtvvFjH+hUPg2iofVxI9xCOJDLq+Ci8k3Cb+E4+W48bOo/VpgaZ1+Ok8wayH6Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mwSMrdFv;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6A606A880
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 22:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F6A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mwSMrdFv
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso5247741a12.0
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 14:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697010; x=1795301810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
        b=mwSMrdFvaSaMRaFF0ZK1A7Bi+hr07aNrtMR/yqpDHHpdOCXYAjKCfbRhpKHjJJBnUj
         2slvF7oq8zinzMNOJoaFu6wWXpg33+cSKSQWmziJJ6hnlrqeLMOJkS3okR9Z9A/ebUk6
         08qqg1uUhMdWHFmrTN9f1qP3uqEf6QKAI15SaGD996hK92sBPKzyiGhKthcnrh6FCBzw
         /agATRKU4NhuLnKrogoQqSUWtpIAtcR6trmGdDNhl2S7KMz4TIT0qXatxmZrH5dT2m4K
         3yJmuSIkqdHDYYnEoH2u15D3I5vauhFRAWClif4zc0KHrorhIomjX/j/PCDlVBJO4mCo
         ZITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697010; x=1795301810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
        b=mXls0agyoxTFjM8SCLd1xXR1d50IHAcpfK6AYlRSPFziadex2ZCDZAJxj996uaXhqw
         z2rbV+6BYsWXhaRBIRHimf58Oem6TwQkahzB7ppGAUwVecbzFeH99YYcuOKLejnYyKza
         JgLB+CvWbaFn96ZNziJk13O0EROGegAj7ru7o3MdenlgA583qvirxpvLaS/lbHJ45Gs5
         gYP9F/e6OLs7jj3lZmxjrRrNYQhuF9wSzgqzK8Nfg7VTPa02R3ZzryCZIth0m+p1E8+6
         oCvQzVDJLQFpELg1cx1fXo0lBlARXc3TS7M0weSYNbpxkjR35BMKSGEPFYUb+ateZNbb
         emxg==
X-Forwarded-Encrypted: i=1; AL+hErG2NldM/1rz0uBKro/oK0uNdDXPdtXl/A60yI3djHuLWiZgO5T4MHEgfHCN8yA6oVQJ46untNCuI4OB1xWlrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z95fkCKBObG/eQKBfmw2v7mlOqX+rXQ+docUhNxvNOQtE+R06wc
	h7I5otqj1yPtY27v98gKnVsuvHr9Dj87yF67KNScr/uFuLif8Yq/gIAq1L8qak8YoA==
X-Gm-Gg: AYBFou14B0FlOV5CNorxRInPr5NPAbe2IEUwgn+sYg3go1BWgjdDJ41rK9KKnS0XCig
	awWNGG20b9TEtoeNtEkpOgn0FxbgvPZemJF/JvQ9lU1eJeyVohF31zEbUPGf7lCq35rP8s09yuB
	/uDdfVBLY3ezzp7KoCpyyOPiyaz6rpk06QMwy0lCMwaVs4sNRK+wFVKUc96zU/fp/LvSlygn4B1
	PMFubLKZ10SwGDh13iJX9SRErUuL/0tbKEky7iRK4KEBnomSDKzawAFt1gTrieLaQvkl7eVfqmb
	8qzMLi1rAGBHWYMnlIzq5BjD5L/x/6GXv44AKJEbo5XFDbF2KLQvJohONGv3+vgCjqDq+cAumdz
	Ui/gf/8clPgCSvQiEzwQlUeQ/HfHgm3vhRUgrYUX06sO3Ey3L9Skqn27vbnZbKGgBtilrnTZwrI
	oKAG5If5MPXc7RW4nylIT9F8Yl1Tva8UiZGl0ymXP5jYeM5zpTonpi/2Un/GWzdd0YEPPNwWvIb
	+rH3m1BJwrq2nvK3v9oLVuJjwP8xh0NvjdJW235aeuW0ebOPdaXd2o3RFY29k/nvCZYOfrnyzWI
	Mzcj0oDE8WCXogEJG+S4abj2UYHI5cmh1aZ3DpZAjWSO9xPW/+dYTtTrU2zVE/ErAFHjeaR5eqB
	b8M0fE0NUInq5m9nhUTE3dbKTViURr+P3ZA0P713b0k7pSRRrpL6aTigDnZ7AZ+lGelk2vHCEXR
	SKl3xOTonK70thBK4srql+8750E+l8qORKWuploclW23Jlt1dDeVyohK19TFcOo5Szr+3vIFThr
	41ijGh6Xzjs8OJVULDQ15bOv0p9CQE/Gn94tyIfLFsoXGoNN+U3/W7GTScbeUC0p6mkKSvdsspt
	ROEtkKh08WHkgwzHC2D/zzF8/0fhpA9JwFv1UTafpdFu2rnWjpbZXEBB8Ms6JQ9k
X-Received: by 2002:a05:6402:194a:b0:6b6:f5b0:889a with SMTP id 4fb4d7f45d1cf-6b7c0ccf784mr6027031a12.35.1794697009564;
        Sat, 14 Nov 2026 14:56:49 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:48 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	kbuild test robot <lkp@intel.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sat, 14 Nov 2026 23:56:43 +0100
Message-ID: <20261114225643.962015-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114225643.962015-1-julius@bairaktaris.de>
References: <20261114225643.962015-1-julius@bairaktaris.de>
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
Changes in v2: continue the host cleanup after a failed early vdev stop and a
failed RTS/CTS update instead of returning from them.

 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9c3f577c9562..a86d1b6c0d73 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4984,9 +4984,7 @@ static int ath11k_station_disassoc(struct ath11k *ar,
 
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
-		ret = ath11k_recalc_rtscts_prot(arvif);
-		if (ret)
-			return ret;
+		ath11k_recalc_rtscts_prot(arvif);
 	}
 
 	ret = ath11k_clear_peer_keys(arvif, sta->addr);
@@ -9922,10 +9920,8 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
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
@@ -10079,6 +10075,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
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


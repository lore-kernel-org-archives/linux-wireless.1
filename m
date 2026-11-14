Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697009;
	b=xAS1LRQAehffndWgCOZirtr9of6U+oB1U36WU0fEhfsGcuQR1JpXgDQVkM+bHhWu9u5P
	 z5cnrAezDlUKnObLuo6RsTW0jIGOjffFekz+MS+YHDFCmEAzgayB6XgdeQQc0BzhsouXC
	 Z73axx3IsmOppdXaUHARTTJKpkcebRIWnXM5/shuPCbo7MstNOpW488n2I3UkJzTdltsE
	 LLLuofZTSXw+RMQbMORL/qPNgMX4MWCQV8ryYA/tptHqJcBN4gXR7SLjEIZEWB2T35f39
	 WSCQiy5EwI/S6qVyv68Gjf7WiILPPAO4DkvWDPFkp+F7rvXSS6l81jzoX9f4O1wqIIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
	b=QFmquo7YieJeyNaaKBY1ANEomBY9D3z9maWHk6rCRrPHp0pqn4U5TQYBKoctc4FaQ0IJ
	 /jG212tyHzFyy0/TKyD3+9pVncRel3/DlBmDMGfmI8ELeId4JFNsIIzgI8ef2a8pPrJkb
	 zJtTFWpVrVLzE8IjehkCKjLXct8/hW9FvSv7+Pj97Kou7sE0EioVK78O2WYJs+bqlfSsk
	 A915q303xqlrC1i54VlzFcKZ6RDVNHCBtJUvp9Je8rpWX+x1bqjHYsvdnfbRMtbN9T9cf
	 SK3pPFjVssYegickwOWziSJHfqpIAwNnoeV/TITK2Z9zQKndskqx5FRkYxZRo++h4lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="FnD/mjZH";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBAB606A880
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 22:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFBAB606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=FnD/mjZH
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50933bdf4bso476959066b.1
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 14:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697007; x=1795301807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
        b=FnD/mjZHY5174VHzgTXAXnBittsBYe6XZIffGEXXS4WHJanLmyr/IpQj1U9vv8XCVG
         ByKojESN1A981LMB2crZFhFSJT7Y6TlVxuuuY6YcGNkFBw0ylslSImEmYwOG6/xam+/W
         gf22QoZ80yEkHfLM0LdQbMuOPBw4KIxKMHQALUbjNuDQkEPzHcj4BOovzBSBSDO/yzEP
         WvF4JNZM20pWAjFbKpEMjJnJzmfL8HFwcmM343AEftOxhUH+Ta4X0C/wGPefh9Dso4/E
         9s69SjD5aonDjeMnKnSZoQbrcFYRgS/yQ48/X48aPJt5kwVlBa8LRVkFG5jCTIvoxJeo
         yIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697007; x=1795301807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
        b=UhrlLhChlMRXywPOWL3t8jMAKphPD5X1Ymsh7aWUhAqCui8fyW7OPWBI6piUSNzY9Z
         4GkeG1hr9Hg3t0lWaqb8LzOfawmrmT5l7kILMl54qneFeby+eTi3PHqIxrWbJw+UH7oM
         aVrdB0p5+Zek8es4MBzRPgJt+7xtAocm62l9HL79u7AIRG2jjAdfn4kfx22gMibErIvD
         x8cxLaWjBbQh+yLoa6DBv3Gt+OXMe8ZvFH5TT8ozARvsYw3fyH2WT0M4g1AFhTP3K0Tp
         ypJH9J4Eod4B29iO81OcE0x3XLJeWqhdWAylOEuuTL2TM4hODosdZKLsileQToIE9rvB
         +zgg==
X-Forwarded-Encrypted: i=1; AL+hErFv6Khaxy0wLthELZKkwsz9wvXA4sKrMFtiAqF3NfO9ZBOpFFBTf8c5ySm+Hl/JtynVZPU2NuRmsSNvuxSxTw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+59UbHc4eBxC1tK8RH8O6xqoIrAPJoOjiBiT5pQxz3O7hl4lx0
	Ikj6yPc5/81ldzBIzcDOF5X4KJZVRCmakwJaWaFLlmNFalArUcxTYBRIBmDCarCoFw==
X-Gm-Gg: AYBFou1qmsT2xug2WaxedWSp7+kL5J+xzQOeHfptUJTMFUzDp+gHUFifljm+hwp6afO
	9K821Dy04XW/gfmhsOq1ELUJcHOK/5u8ve6Bo8NHy5StESaesydhQaq1uKBPj2AcdhuwVPkvr+7
	Ob4PrMF4B0DWPz5tNWKTEx7i3dFc7hIlOgAki89PD8JB8QG2vhD69X2gIb+tjJYS4UgOe+pWHN6
	Z+rcCtzPcl2HX6ROB2s+PRt7M7IS089alfZSHVxxDzWdTkcVhW9FQVVaE6lDT+tFbcYMbu/ubeD
	hGqq3kLoTPqdFchZKAka6eEFBOJlmQI8+z2+dEXkFFImCtdKTiWEbpqYpJlL9h2kbYYf2FXZKo0
	mJZoHSwDcT4LR0vfqNEli6U2Ump314L50SSBeLdMOpiQMMAHiUTzQuvkAY73XngR25CXjpIfSyl
	qmMWMPgL0mfbVdffaji1Kj2ckbSoqyXwGYlg8v9tMHKp/Yo3FnrMKu7lGKxzEHWyTI65Au9eTzI
	RJb74cPdIBvNHvl8V9T0dT+KkwjKxUvRjrrTysUQMm2hOECESZaq2LhXECBHRWOYvfJ+7gd0MGC
	pXoCI/Q1BwhoLAepRjj2N2Q+hnX4eb834UeYydJ9r++VgJyJzUTVnVPy2fCKbYFG34kcyP96Gw0
	C38JAuS9OoI/UU+L4r06MUGMToNHAeKptu7jFaDtpWXFN4iRxGjgKB/ys1zJVD8jG8kI2eLY+11
	GYqJ4uD2yAyuwayVkbkgv5WfEJJSxiBthuOfgu0dfbJM//iQvuibmls/k2CoYnkJVYQVjNOILCd
	0S+JNg095ctazv/765ZfKrS8s4lFj6hb6j+4UxqmA9gds2F+AvDh0Fw5VpdMAd4dZrrCP4ssF9+
	xUhSLiJTJSDq0MXEXR3Xs2FoZVRkePPwMJdSJz/bJPkDgnhoEARhkE5hWVWm/A+g
X-Received: by 2002:a17:906:f043:b0:c49:9247:9688 with SMTP id a640c23a62f3a-c507bc6cd67mr755011266b.7.1794697007245;
        Sat, 14 Nov 2026 14:56:47 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:46 -0800 (PST)
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
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: forget a key the firmware failed to remove
Date: Sat, 14 Nov 2026 23:56:42 +0100
Message-ID: <20261114225643.962015-2-julius@bairaktaris.de>
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

mac80211 frees a key after set_key() with DISABLE_KEY whatever the
driver returns. When the WMI command to remove the key fails, ath11k
returns before it clears peer->keys[], so the peer keeps a pointer to
the freed key. While the firmware is down, removing a station frees its
keys this way, and the following ASSOC -> AUTH transition passes the
freed keys to ath11k_install_key() from ath11k_clear_peer_keys().

Clear the host reference to a disabled key also when the firmware
command fails.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2: new patch.

 drivers/net/wireless/ath/ath11k/mac.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..9c3f577c9562 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4615,17 +4615,22 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
 	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+		/* mac80211 frees a disabled key whatever this returns, so
+		 * forget it below even if the firmware did not remove it.
+		 */
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
 		if (ret) {
 			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
 				    ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		if (flags == WMI_KEY_GROUP && cmd == SET_KEY && is_ap_with_no_sta)
-- 
2.53.0


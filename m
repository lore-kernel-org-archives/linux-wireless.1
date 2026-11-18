Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026965;
	b=KtJTS+O8TZlPx4CvKHuFyuZ+X7hXf8kVLrnZET9QVBfEL+D28ckbPRIfsWsVCd8I8/Y6
	 gcha2XTSWpUKHTXlJ1G16bcvOWLYB+Q9nAUF85lU+8OHxbxtErRq/n+wkQBflWBm8nMv8
	 znrux9H2Srxy2nQs7nHqtXmdaFgQx/kTUvQ+rn5JW29eohyShoinlD3nJqfIX+yr7xwRG
	 XV9+9QO6N14OpwOPn9DqGfcneirw/AWKJjxm4RBECPfYD2aF1yV2GYz/dFWUaSSg/z7bO
	 YA5bGnjIxc4LmAMc+ipJ9uzlRzujwvEz7/9kzoWjPni6GLVQW028OT7z7ogHmwNK46A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8RDyAIx6GdPyur2p4krhRfb/lrH/VMCLoWVTsANEHhI=;
	b=NFZt4X6/pu2lFP52om7V2X9LhuHiuhfzH0rV36UfDqFpnqfWYFYdQx6/27toLJzQn36K
	 EzKl6Uutc1DOspzmi8D3kXltt3q7Kg16NY63Z8geuwQc5l6vA4nhKDasZYN0PEWGkezta
	 fte+MULWmzb8q4towMRJ7W+fLQRp1LNjC/GZYk7ZrVEQHMTc674Qe+fRI7SoSq57xeDPH
	 asjhDDjR0F9zQnrsoowABMlqMifFv1Uq5Y44qUazXK1lB4bdKj09NA6qtwiml9/hj+04T
	 vodafrh1kg5qfZHuAHhMHRNkdYReqJhGISMfCNWeKPxKy37nhK8/oDsVArLPTVuv+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmAcvJnL;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A36606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A36606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmAcvJnL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3712b6d9843so1534581eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026964; x=1795631764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RDyAIx6GdPyur2p4krhRfb/lrH/VMCLoWVTsANEHhI=;
        b=kmAcvJnL0+eiYXsyN8IMK9D8KwnlkRZHRuuD9sBxVGn5t2mob9W8a/IaGyCKBnoPXo
         Vd+TDCxJ7g5FKRfitt4LhgaQYVaYShyMWk7KrCzqg0gNLr3+tArJDgRuyYbrZk/Y9IDC
         ghCHM6Agc+jSakuk3SRYN53xY27OzB6ErohGLrGTYKtqp1c64tQLONvhveiUtiSjih5X
         h3xwBeRiQlOVpLqaLA5JxJiBAsmBx8E4R93y7TqFHbZ18gvvQUSGpC3gdZ9ptWMIwG0X
         EZ7JvNQqIpAfbPLC/lgL0HQqcCdE8Hc6GepMhdP9SYzv62xf5tkTQZQbkxW72NbHHLjl
         kBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026964; x=1795631764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8RDyAIx6GdPyur2p4krhRfb/lrH/VMCLoWVTsANEHhI=;
        b=Z4zTcka+FZ0ZxzYj5JM2SW4ixaXLduRz0nhIisQGB7vj8/fJkp+LPMwjKsJWtCBKIA
         Hxv2kEVkNRMHh/DTYxbPBv8zPMbdN/hrvpSNL9DwzrHowPqUBgk+6K8CqTRQV0vhAjq2
         TefjZj98L+W82SCktQRLbLgFbWIFNpNl9gxNuHXJp6b9P3shHqJvdkTGgQZ7qzRsyv5H
         hRifCVB9PLPykDcMFrw6y40IH3QKQLxIjfMQSnFHeaF2bVFgGUiSTioy6TSXuxzA15ac
         wKF9l/Z/jTW7CMLvfAeljDOZr1yoDC8682oKmSVl7Imd1VJ2r0HLkG4k8MoxrcVAY+Mn
         bRjw==
X-Forwarded-Encrypted: i=1; AL+hErGxUPZ8rjyzlVvEwMDSD9O0iPX6qdxx4z2PLj7sf2eCQKJh7DyJerPE7Zf1Fzaf1ltB/YKy/lQdxzROKGL3Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vcIRjCAYXtN/Z2uUpiT5jCTIditaLwL1fylW+aHYxFDFSOLQ2
	MDARcJpZOF67/NnVqa/4LaZtcg7P3wYSWOeQpwJvPzqLiEYHAMJCbMdF
X-Gm-Gg: AZFdTZcPgNvu8IRHFLxcKEzqqqxOE2yTyoAfolTBX25MV/TXFGCzt9+r9Uv0Ij39gWw
	iFMdlvmRGiD+hNLJhPyk5toKeQtDZnRkrGu0Y6YXlT2VXWK8s97N1CkDrMy4mQDCqa+86Do2Suo
	ON8YUVS9S/xTQHgKiYJiE49yMsX57+ab3cYQ5K/0WeSW/0vgV7t3PGlUj+sJXtjgNEly7lxOn5J
	0v9vY0mtpEZdpBY/prWq+wb147GIw9km2NWWcEtmVtZEWnSkIgjXLbUbtYABIZQ+lllx3J9A683
	88YxJATWCl8fW5CfQp2J5k+x4ibaPZDZr4Q/97MPdmJpzqiUMwtBnXEhVHejwdlYIGsGpjSk9ez
	F3wmm4LDEFSYpAWiQF2qFe3NHkKKFfAHaRaJWudImCMxJijjtnmxQDSta2ABCFZii3ROWzK34Ne
	UD7h0XHBb2CLdphugXZid695k6au3jqjt8EdCznklGxmYPoyGfE925mY6jcxVHiQFA7KyutrF3q
	Zou4qtrq4LYG+FCVqqLBqkh8hcsd93ZXbYiT/37kvQIYbhsCPPeK9j2cOHBGdcscHnPYDNMBbx0
	NxPttoAPzSYhnaHEk4ER8uOZM4Gewn6CooRXXefJd5yUpLvU4g==
X-Received: by 2002:a05:7301:190a:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-38281bfa917mr3311876eec.38.1795026963313;
        Wed, 18 Nov 2026 10:36:03 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:36:03 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless v2 4/4] wifi: nxpwifi: stop AP when delayed channel switch fails
Date: Thu, 19 Nov 2026 02:35:06 +0800
Message-ID: <20261118183506.45749-5-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118183506.45749-1-enderaoelyther@gmail.com>
References: <20261118183506.45749-1-enderaoelyther@gmail.com>
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

The delayed channel-switch work can fail while stopping the BSS, setting
the beacon or restarting the AP. It then returns without telling
cfg80211, and TX stays enabled over the stopped BSS unless the request
set block_tx.

On each failure, stop the carrier and TX queues, clear uap_stop_tx and
request interface shutdown, then free the beacon update as on success.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/11h.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11h.c b/drivers/net/wireless/nxp/nxpwifi/11h.c
index a6c87dfad9ee..d83f36b1c8a5 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11h.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11h.c
@@ -300,22 +300,22 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	bss_cfg = &priv->bss_cfg;
 	if (!bss_cfg->beacon_period) {
 		nxpwifi_dbg(adapter, ERROR,
-			    "channel switch: AP already stopped\n");
-		goto out;
+			    "channel switch: AP configuration is missing\n");
+		goto stop_iface;
 	}
 
 	if (nxpwifi_send_cmd(priv, HOST_CMD_UAP_BSS_STOP,
 			     HOST_ACT_GEN_SET, 0, NULL, true)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to stop the BSS\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	if (nxpwifi_cfg80211_change_beacon(adapter->wiphy, priv->netdev,
 					   priv->ap_update_info)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to set beacon\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	nxpwifi_uap_set_channel(priv, bss_cfg, priv->dfs_chandef);
@@ -323,7 +323,7 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (nxpwifi_config_start_uap(priv, bss_cfg)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "Failed to start AP after channel switch\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	nxpwifi_dbg(adapter, MSG,
@@ -337,6 +337,13 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 		priv->uap_stop_tx = false;
 	}
 
+	goto out;
+
+stop_iface:
+	netif_carrier_off(priv->netdev);
+	nxpwifi_stop_net_dev_queue(priv->netdev, adapter);
+	priv->uap_stop_tx = false;
+	cfg80211_stop_iface(wiphy, &priv->wdev, GFP_KERNEL);
 out:
 	kfree(priv->ap_update_info);
 	priv->ap_update_info = NULL;
-- 
2.56.1


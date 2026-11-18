Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026949;
	b=k6Emj+3g62V/0HZHLi+Os1g+Xl4Xl/4jzCDcbdajA4+Pg6yOE0JZW223GGZR9EJvgprC
	 Je5HlDwaQwWBOIfM1Vwf88tvNzkTlen9bvh0ZbMdHwc5nFqsL2O133ZJKKAr8kNSzOipf
	 QHFuFpvVR0CqoE1wHtvp6SCqFqAKsl1tkzBS4GVESZs3eIEYNMkboEAwad6UdzlxOzqIG
	 sRkOK1Scux7TnYrbDIzq9Gqpz6vzb7kIKsloVBok6M0cYMcUi/JCwK/Zx8jtAIo1Bhml/
	 f6NKiuj5RrV2aTeY3DbWJ69dtqCZl1J9VIlbis0nkd8tiTBI5yXhqcCxoicAo9YGswg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AMr/kZW4+kvAE0nS8oXztOJCwRpyD037PL8XekrkuT0=;
	b=antRZsZ0YARicx1gZaLSXQnBNDVDKRtsW84Y1QyRjMDy+PmlShKbVKm38hXGDM/QcnH5
	 BlNXvlF9JK1ND0q0GjvB265hTIIxdt/p9dTe+ehpu1bG+xex8MZSnEs51kAXb+/+KPo4x
	 m4N3xCXJrNEE2v/yg1Qwl3wb/854SRoeNa+EqUB+R3f76jgIyn3R2McmJlrT8E3lUSY5Q
	 MqngcI29SpUdW4JTzJAYwZRKEx2Jh0+UOUQx9gNoHIngIPZTNbUD17liK/XNWJn8Ppx/K
	 ju8Yx2ee4llaPdnUebHT3UkpObUDPDc4UtdEZh5o1zi8hxKR5mjhA4PL6JoVeK7+KOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOXXHkg+;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA65606A320
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA65606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOXXHkg+
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38318d69173so1198139eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026948; x=1795631748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMr/kZW4+kvAE0nS8oXztOJCwRpyD037PL8XekrkuT0=;
        b=iOXXHkg+n/ce/O717VOf0Xpv9u+HmYUoznTml1fkw1ailXngV+JSSmjuiecNPvXkYI
         +kwzAjzb1lwmb9b61E/RI3iJTyrP45yIPuMI5j8hZ5FaLrM8KAAYH2BFhha89xo6K2B7
         O+prREh2tD8Nos7PPpAqytEVof0geSzpzC+9QKUXy7d7rUJaPX0/cCrHkNtr2p5eAaTl
         8xUwdPwm+iok4h8tAqKD5uUEO2rUD1EaNGaIxJAFFgAj8N41PgxbOgYJAmZuKo0/ZK+F
         InGKJfSFI8/PY2LwRsby7+zz1bpIWOL2ubwiMiaHQZ3Id3lIKc+R1ohAvxqSAob2xVVr
         IP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026948; x=1795631748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMr/kZW4+kvAE0nS8oXztOJCwRpyD037PL8XekrkuT0=;
        b=RgBx4MU3iXyvrZKNEqi33h2oqRtTr0LEOxPnDRRnGBnmqe6SyLg8PTgaMyeOi4ZmS1
         KIIweSGF3sVbDVmUbvLxx5ubQjVv1elHGKOlct+JEg5FoeRZ0yHH5FGMbIKkNkSeh+z5
         kQvRfR1WjyfTIAcWUluiklP2dFPEbMSqJBLfSvFpse0zgjll10nzPdtZJnRWyOcrVZvQ
         2hw6nJRts1VBxuKsajzHnWauJIQ8UdlAdv+iOmQbmdeqx5gyENR+D0xIWATpCVt8Fx7w
         DuR0xy3byZLvfFaXtDl9FCV9K8YmA/mgHwgBEaNgi9UnUoMuUAopD7wZhLkQnVvpMZRh
         hKQA==
X-Forwarded-Encrypted: i=1; AL+hErEtE2a7FPDwI/cXDA0kq1YWKmAS8VCZp3gcT+SG4Nghb57i5a81PGq9X60cHS2EyqP6Y6O+agk+j1yNvENFzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mq9uo+/W6041e8vmI40LOLnPrCNS9w2cx58U1ru5WNnRu7Ax3
	usszM1HgIFt2RG3KRYnVyDjIitOUsRjrLg+Yccv4Fh6hMfptd2kSothm
X-Gm-Gg: AYBFou3y5LIZYgNoiFVVgIcbOf2y7cZvv7K2qldqXNXwuF5FA3WvxJbiaHgpdynPPeN
	jvb6SeM7CZkWDOcvYi08PGeC8Dx/C3DKHGrSXxk7TBnzb3tO1s2SydzrkQrAu6US0ihOzi60ubW
	fBSOyqUN+7544QH79QAtu1hla6/qXVv/1ru8GOuXFYBNpnwszEMXmSxCARtgwDp2HCwvWAhu2qy
	Wq6sIlZoz8NY/HwI7uOGh6315xL/Lf9a/dTHrUWiaP7G18jcHMB0mrKrmwzgYjxMOc/FfIIuVkl
	APp6j0EkQCZWAktqdD0T1JGjEcCO5BBUlvrKhWqaSGqjEHyayQ/ufJVaOF6BJ4NKW/hrAdsuXwl
	Q1hIFxljritI2TEWwQWpJ1LUL68weP0xORPBse/d3JQy02/gHrsgKpCzw6S5wHukESTwV9Vd3/v
	WTQczmmV9Qa7mYYEI8Bwl27SbpJR0IP/szb+7lXNi7iS81XHJO74JKDxZUE3LLdS5jc1I1IteN+
	ag+HijAUsbBYvtqRuKvKBnAwnSAPX/lFWfA30zgim5XlnFpV3KbjqzI7rQIYuX8l8/nVtaKILfI
	MikgNFv3szgWQNaxGWwGs/POIzr3OJsCMOfjYdoqQiHhI3GByw==
X-Received: by 2002:a05:7300:c7c4:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-382818137a5mr3475399eec.29.1795026947011;
        Wed, 18 Nov 2026 10:35:47 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:46 -0800 (PST)
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
Subject: [PATCH wireless v2 2/4] wifi: nxpwifi: stop AP TX after preparing channel switch
Date: Thu, 19 Nov 2026 02:35:04 +0800
Message-ID: <20261118183506.45749-3-enderaoelyther@gmail.com>
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

A channel switch with block_tx set disables the carrier and TX queues
before the CSA management IEs are installed. If installing them fails,
the request is rejected but TX stays stopped.

Stop TX only after the IEs are installed.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 5b8fb37c3f3d..a9cee7e602f0 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -3117,12 +3117,6 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				       &priv->dfs_chandef))
 		return -EINVAL;
 
-	if (params->block_tx) {
-		netif_carrier_off(priv->netdev);
-		nxpwifi_stop_net_dev_queue(priv->netdev, priv->adapter);
-		priv->uap_stop_tx = true;
-	}
-
 	ret = nxpwifi_del_mgmt_ies(priv);
 	if (ret)
 		nxpwifi_dbg(priv->adapter, ERROR,
@@ -3139,6 +3133,12 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 	memcpy(&priv->ap_update_info.beacon, &params->beacon_after,
 	       sizeof(priv->ap_update_info.beacon));
 
+	if (params->block_tx) {
+		netif_carrier_off(priv->netdev);
+		nxpwifi_stop_net_dev_queue(priv->netdev, priv->adapter);
+		priv->uap_stop_tx = true;
+	}
+
 	chsw_msec = max(params->count * priv->bss_cfg.beacon_period, 100);
 
 	nxpwifi_queue_delayed_wiphy_work(priv->adapter,
-- 
2.56.1


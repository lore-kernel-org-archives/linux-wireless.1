Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025218;
	b=z083p6MMmfvdme1bzzuMSOZ9lAQVJgTQfuD1xJ1OOJX6Tstr1jSXMHJqjDDsGr04vu2u
	 gnH5A3XliaY6tpwn+PAaggbMmov0zMCMHsEk7ywMb0QhWAdXAH4NSEPproyf6CghQ7O9B
	 qKH8aR55c6CYLv46gD/HJtdntAM3K9IfvTIj3b6vCgHDkyx4AzM3kV/647ptUF0yaoO+/
	 qfsR2MixTIeq6owmiTpoVE/PphYTjEu3B//aevn2NGjEl6h1B4vP+2cMWfJIQIu9D9sXk
	 O5dcVIZhQzZegcrbKmk5yENTAkMC3Mc65pThSvqC/lvOv7Uee/wXrprf/a9zZ00DFeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025218;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=yQFc6LSoGOm3sJGEs8L1Xmc4hjG7iVBzxwW8/ryu/2E=;
	b=kTrOWIucrmynUAfDE8PtvRUlpHVLD3X5ax61BiLj+U9gPlz/iqCVAVGbl6F0maOUcGmw
	 GQGL/IvkDWs+56ruywkaE+X+opGHNp3NkXeSbmxR7A9UQCC2S2+Rb0wD0eG6i5PYB5KpA
	 3nG7W1eNkpPgmGLESZQoCmYaB9Qe89HPFAZQnGTzh7fYvO+XfoTP+MA8C/MfKUrBv1AqU
	 EfObYinu4J3OU8tOvF/HeFmEiTeWhvVMikUd1ApkGi30JC+aMxkcYDfMGGXVK6OY3Y/+3
	 2gK6H29SbmUCwDM4Bn5Nr5bsG+NRQrMBOOhJp7nV9yeSuD1mEax8xd2mDVjx6eWfbdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=jpVRspc0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4FD606A325;
	Wed, 18 Nov 2026 18:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4FD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=jpVRspc0
ARC-Seal: i=1; a=rsa-sha256; t=1795025088; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AM96ZDfqhxx8xcqSTWkbUDelqCfAo0Q6XXTTZJWcliI/hsVnjEbSAaqbehMMtrYVhvxMw7jBcXB0GnAl44LTz/KjapMB2xtMSn7paI1CHlmT3pvMNULDKRZaANXmXKPo7uDjhSN3bzw3f4tTiTrXfJVk/mNvK4qJeGnuNysn8bw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795025088; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yQFc6LSoGOm3sJGEs8L1Xmc4hjG7iVBzxwW8/ryu/2E=; 
	b=i+BZDGuGzN7qRShCQDHLamxyJv5J7WG8PU33AuDPuBS+xobV6CA+YD3TL39oFTpDd6D69Hc2rhkoE0B3hywB3R4fYgCWlYPoMvv9B3HuLcd9E/xM3OBsNylWy7qC12MI2lugXniD+5IXL0W9x5r4FLUNcRSh9bNMDe+cRXRboco=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=jpVRspc03moFq9P21XMHu+CY/Bb1+eLv/8TNtNFkW+dL1ql8Q0rZ2IVpcc6+XZgXRGQE+J6DZPtMDywWS+KK6g0Tg+8wdARgnVt9YUEgPp6Oc9wSY92HQDiIW8c97SzRNZmLHCU0Zp9f5Km72Co5STmkgI9HSHqLZNiuCSnFTWcTG9R/StiLcoJb6SnxAYvLr++tfav/H6h1QYgA/S+wyDXb/0vzQwtFsZf5iXf0dNfhfP+awciPdXngnvycmaCZU56+qyIUm4XArbviW9ZBWruW6hxQd35eNbV6BXyRg541sUrGOlaQHOkU+oDXWq+h4V4v1Ondx1vlBShhPPo4VA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=yQFc6LSoGOm3sJGEs8L1Xmc4hjG7iVBzxwW8/ryu/2E=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795025086507268.54071679078265;
	Wed, 18 Nov 2026 10:04:46 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v7 3/5] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Wed, 18 Nov 2026 23:04:33 +0500
Message-ID: <20261118180435.904-4-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261118180435.904-1-owner@ph4ntom-rev.uz>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

Fix the operating channel not being restored after bringing a monitor
interface down and back up on devices that do not use native chanctx
callbacks (such as RTL8852AE when firmware lacks beacon filtering).

Stopping the interface powers down the PHY while mac80211 retains the
previous chandef and omits IEEE80211_CONF_CHANGE_CHANNEL on restart.
Record support_chanctx in rtwdev and set IEEE80211_CONF_CHANGE_CHANNEL
when re-entering monitor mode from idle on non-chanctx devices so the
channel is applied again.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c     | 1 +
 drivers/net/wireless/realtek/rtw89/core.h     | 1 +
 drivers/net/wireless/realtek/rtw89/mac80211.c | 7 +++++++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 37ff745..8333b26 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -7761,6 +7761,7 @@ struct rtw89_dev *rtw89_alloc_ieee80211_hw(struct device *device,
 	rtwdev->board = info->board;
 	rtwdev->fw.req.firmware = firmware;
 	rtwdev->fw.fw_format = fw_format;
+	rtwdev->support_chanctx = !no_chanctx;
 	rtwdev->support_mlo = support_mlo;
 
 	bitmap_copy(rtwdev->quirks, &chip->default_quirks, NUM_OF_RTW89_QUIRKS);
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 8e93cf1..780ec47 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -7703,6 +7703,7 @@ struct rtw89_dev {
 	const struct rtw89_io_ops *io;
 
 	bool dbcc_en;
+	bool support_chanctx;
 	bool support_mlo;
 	enum rtw89_mlo_dbcc_mode mlo_dbcc_mode;
 	struct rtw89_hw_scan_info scan_info;
diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index 7a55fed..98f4b5c 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -97,6 +97,13 @@ static int rtw89_ops_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 
 	rtw89_leave_ps_mode(rtwdev);
 
+	if (!rtwdev->support_chanctx &&
+	    changed & IEEE80211_CONF_CHANGE_IDLE &&
+	    changed & IEEE80211_CONF_CHANGE_MONITOR &&
+	    !(hw->conf.flags & IEEE80211_CONF_IDLE) &&
+	    hw->conf.flags & IEEE80211_CONF_MONITOR)
+		changed |= IEEE80211_CONF_CHANGE_CHANNEL;
+
 	if ((changed & IEEE80211_CONF_CHANGE_IDLE) &&
 	    !(hw->conf.flags & IEEE80211_CONF_IDLE))
 		rtw89_leave_ips(rtwdev);
-- 
2.56.0.windows.4


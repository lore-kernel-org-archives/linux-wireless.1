Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025254;
	b=IWOWQV++r4DNPa+hZUxydk8g1mEBvDf10dOw0UHOFLfqgtpRKUuRrUoxLM/fKVKA4fqm
	 33IdAkpm7HY3Yn7jRLgQPXdYtNFvi0hTbDNwzFy2F4l1pvQ00j8gVl/ZyqWr0w9U1vsRP
	 lgDydzaG1jkX0kFoQf/s3CjsnGmos+hzoA3cab59u1ER1QsMj5uAx9bM5DlTXgB/24BNH
	 6UNlPc9J3v9HXkWl8umAYuPqRd6jc1GhG6aIUrgT2p8wUYZWhEyg1fMWCQgjwonPi9jjj
	 H9DxRnENtj05QqsxnU1uwx0NuYaOu6sih2AsjbTeIcZsxrZ7JIbAO1+FBy8lUORd7lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025254;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=VOWIci4KCIgNCmc0R/UijKYV6Hb5q84/DaZ7ApZD5DE=;
	b=3uxoTOKofLL9km4oNU1y87Pr9ea9y/qtdCEDIcEQ7CrBOU7zoXrEt69mHKbpyuYWTGXL
	 b+1kLHg8QbarinhxHOFYeaWn4Zx/Y+dkQY76xdYh+UkgPKIyskt+/TTyXGKAWnNlD3DHY
	 MAluQUvDBToknEs7jEuPD7UftnmBQEUZvyHHVSirAsW8UvBnOPEDVBoFatjb9T0+g02k8
	 97t5G9hxgV6L5rH1+kwExe0J3307ihb0sDlo/mzDNqrMJA4VPvwCdlwyuFvrZXhI3Itc1
	 APMljmJ1HircyRqsa5D0U6MbpC9BduADdIv6c4Y7EVaYGkpLZ4HGsl33PfE0J5UAnag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Hgj9I0Jn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F975606A320;
	Wed, 18 Nov 2026 18:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F975606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Hgj9I0Jn
ARC-Seal: i=1; a=rsa-sha256; t=1795025092; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TjkOVZa8uJBQJpEuuFHu4zlly1JLgdyXXlth3uO+16iaNjv7KK5rARKLAlj+tKK6qm7wrvaceFZrKbNncgJEA7Jk4aEtRwmJmBH6i5Yix7nk5AkDxDFNfQfcPwZhFRWqYT/HqUxehG9Va1WuDeKn4fKEwpZ6YniKwJCMWMapB7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795025092; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VOWIci4KCIgNCmc0R/UijKYV6Hb5q84/DaZ7ApZD5DE=; 
	b=S/JfCqU0+J6kYdYhujj/9406FLvV6FetuM1/hv0GhvLGzwQjEw8gc32RTdP6gJKryuk3OaDg51FfFqZMvnuvqKDy8t+i7AdIqNhRESENZljTSq5arBJLUGiNwbdx7HIBVe5KbTlpdq92NyVt6x2Rm+Cd9up41wxWadu6mR++/p0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=Hgj9I0JnM3sdwaI3gWlKk/Es3Q/T9nWHevOSiw9x2BypJeXY0FUstwGTmW02OMTUosc4AtNwQswPS7AIrM9gYST79ESE2fHCqtbkqHeRkYZO0VyUOj7e0qAI0sQjEUPxnNQMpleeRXxcx7y3FXCwQkBe/GilrAqW5dgzZI0WfSjVOjg3IXODDQoKTR5cGrJsZ6ZjTKbFbSpf3Z0QNLSvOvPvA1/8ZUpd9F1AMHPBoOKEqG96PNjjPRqSD7FYW5bUyaKqYZUONqOBDzdBJ/4vPt/XAkGTCGGQ3ZoLGuQeLFkLGd5jfIMmFRcbsvHHNHMPdV69O4je7JKSyub3zNJAxg==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=VOWIci4KCIgNCmc0R/UijKYV6Hb5q84/DaZ7ApZD5DE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179502509024438.78729622665901;
	Wed, 18 Nov 2026 10:04:50 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v7 4/5] wifi: rtw89: avoid reading seq_ctrl on control frames
Date: Wed, 18 Nov 2026 23:04:34 +0500
Message-ID: <20261118180435.904-5-owner@ph4ntom-rev.uz>
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

Injected 802.11 control frames such as 10-byte ACK/CTS or 16-byte RTS
do not carry a sequence control field and are shorter than a 24-byte
3-address header.

Set seq to 0 for control frames instead of reading hdr->seq_ctrl.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 8333b26..e599058 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1317,7 +1317,10 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rtwdev,
 	else if (tx_req->vif)
 		desc_info->mlo = ieee80211_vif_is_mld(tx_req->vif);
 
-	seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
+	if (ieee80211_is_ctl(hdr->frame_control))
+		seq = 0;
+	else
+		seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
 	addr_cam = rtw89_get_addr_cam_of(tx_req->rtwvif_link,
 					 tx_req->rtwsta_link);
 	if (addr_cam->valid && desc_info->mlo)
-- 
2.56.0.windows.4


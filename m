Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795075522;
	b=eQQsRlJBHm68ixZFybVIqWV/BXb2JvSkaHMWpSfwEqe0MIkA2DXb9ugsM95M2Yq+Q3Y7
	 icWz4ihqn2VKdc2/LeUp9o9UwGYrPHoPsSWaEyjfB2Krtxzr+qGhMWW++r3JYszFtUZ5v
	 DhnVZlW99JlaiAJc2MDRSbpBBv6VxXGtL7kOh9zxVfkt1htAwkMPiFZnJ12UCrM/A/DmL
	 3V0jJCmrGQ3zacXdPfy/owPZrXj/WRUke0QVXNtOjSQoEUpjvnIwyYUH4c1VFcgcYrbKX
	 jblScGJp3U+/Wq5ukyoo/h6jdUwv6uio28ki3cvCNvcUun4fH8VjOuz64WnyGyTz7uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075522;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=qrCy/AUjHH29fqBqskuO7dyQiBUQFkOmUmiS3QCNGRo=;
	b=fIg0tKJ06UQqmgD3+csqWkxYsi8SDPBeBJHqZ9o5ImZnorGvnbA+l8SUOJSPIn9W3QqE
	 xwzyMXMPqWh8ksz4U747CdNkpqjQQpT1qksO6FmNXnRv9t8Yqcc4UR2jX/9mj5gs9cogG
	 vl/65ytRzLirVEc5F+uVH+DPo+KDIirQPtoiQbHNJM+lTq11znaK1W0IDh6Q9QAzHGKve
	 gvjVJxZIFmC461w+u7znHZQhZw2vNHUs13qnFzci3SsLG5hbASRKekxIZZ7IWB1Q31NNu
	 fhYGpx6DEPe25BXMZVdf5k9m9Kqmw80HgZz83z5SmWePmFgYJdiJhVJPcSZsUdNVm2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b="bE/lV8Z/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4560A2600;
	Thu, 19 Nov 2026 08:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E4560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=bE/lV8Z/
ARC-Seal: i=1; a=rsa-sha256; t=1795075420; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=COrirA4AOgz8+6XyDDjFwdlT3lfvvBbeeOJGh+0gVn40VfbgXdBEiIl54EtHOEPs8tavbGbPHcSDqOiF/DcF2tgA0uU+YuLpy8SzxJzKE3qm1bqvSDiij9Qh4+E8TIK8s/VlgPIPnYHJIi31UvjB+tnqFqmscPo2Q4xPfc3FEdo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795075420; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qrCy/AUjHH29fqBqskuO7dyQiBUQFkOmUmiS3QCNGRo=; 
	b=LccsO5j9jDtjA968om4p9gCP3HFguBYoxy3WnyIMc1JjgcPdua09Nm0vthgKetYC5FHjlYuy98Q6YRwB1bqav9ViNx4K+YvPLTpIk2UIoeRW0LN0I1cKJJB/Ql/t+GugYcDRdRHiSBi8bscaVguYSHX119XwNf6kNOr8mxCQqAw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=bE/lV8Z/3kLAqHQdurr4EDBORw9o5PTtgkP/tq0j7J/Mf7hgDHzlKvPeUyYGP3Dl+Ud7K6AcsiK0IDVHJFo3q0PIEokSIGuNYNtBlOWkYTzLuAQ2nYGB8ZTZPQHZG5pQW/eLwyPeUvZPg17eCwbeK88yTN8LT4cqqZEsrinRFn2A2998qnxYni1CiNxKgsrRpnkQ911TjiWP7mrwKjLQBHafVmy3WxgxLhpyfLwmOU5X0Wb9/bpHI7GJjT9EmkgY6VgWQDL/ON1p3Q9de2fHXveliIIpgrO9B7yxrA3M4t1+AcjatibnANHKLUVP8Sx1CI3hrU0MN0P8OQddrmjXGw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=qrCy/AUjHH29fqBqskuO7dyQiBUQFkOmUmiS3QCNGRo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795075419062991.4211394482294;
	Thu, 19 Nov 2026 00:03:39 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v8 3/5] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Thu, 19 Nov 2026 13:03:26 +0500
Message-ID: <20261119080328.391-4-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261119080328.391-1-owner@ph4ntom-rev.uz>
References: <20261119080328.391-1-owner@ph4ntom-rev.uz>
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
Reviewed-by: Zong-Zhe Yang <kevin_yang@realtek.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
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


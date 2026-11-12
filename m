Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481351;
	b=IOvzrPWBZybC31nLniqAjSqQlvVMxZitUA4sDEmxxM48vjQh8ZbuUlnzPzJlMdUCdRXC
	 H2vWJAuJ4qAYZL3QajgKBd5D+Fu5YMoR/a9qa83GtuByGoOdxawziLVt6VVm15MTnx4yj
	 k8uTfWOYMKKQXggoDQABbZV14sc3887zqdgvg5j2tvjZA/g4C8qJ9cfyJvnAi6Us+nmfa
	 2/yrZj7zf7PMIcJIyhVGG3ndLbND2eAIfBRaQDlJsI6SmV4N6lx/EaJ80v66AwHnZ0wUv
	 LECd30X6sFLXJvfoS3fBZbK3TsSsA+HW3/JY7TL8Ef0SXNbuj/1k3Fv4N6Pvo+hb2kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
	b=qycCspRTcLtg+56cWBDqmW+jSdZUVJQSSWvoUkEsWgqTivhb+evpf8p55E1FYApknXrA
	 mcbD1MZwNFdpSElALcep7VwUHLzN/+EirdZud7Euo3FhlpwJRikBWj/jcHN3/SbPBsKSK
	 9m4d3h3++XLFINc6YrWVB4uIsASCKi7H6GoqwaVYaaskr/AsYYpciye2Dvr3Qw5owkUA2
	 hgHZjkDDwZ+bjpP3ixaziJ4TZzf6+Z5UA9O6SojsCIKfdSPjZX6iFdCUrmpa842i5ybcy
	 wYZPxKqNeoypQojR5fzgnOXNS5Wuafrfm98MHbl1WhO6jjoKmn6zwuCX/u4eR0PJrpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbRO14aS;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C43606A330
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C43606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbRO14aS
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14e307f29so4373250e87.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481350; x=1795086150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
        b=SbRO14aSK6eZS9sG5FXUufqZjezzaI7Rb1FyXGAN4dErqCNWwUuCu3100k81EHwgLZ
         dshwHFXRk8rBcC7e5P5iCapwvFNkN/DW2p9s+VufKLiKyPyHspKqx3nKoRfj0v40cFSl
         b/LiqfYDlhgHwg1xZ6c8/wFhB0HMsxZX0lixpthDMq73HjTKiEEcjG2uwGZWmuWddrXi
         vAh9jR3w304oITQxoXiBSUTIKiOZ8AGiZrAnf4ygHlpal9XQ/HiJ0Lt7HiXFLyDEQq8d
         IFadt2delMv3+shh1PKQ6OJ+MK5U7vYcwqQtpe7MAIP4i2iwC92Sg+6R6WpIrm84/6ZJ
         9e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481350; x=1795086150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
        b=I7RUlKLvPayYoCdnsZ4pv8W0YW3Y+1NTJAZzdlgjgOCnOm9xqLIP9XnWT/+xye4T9+
         SFY8an6WeG4usphJTF14jgKLiRbFigNyP/WRMx4QH7PXPbwBQyEFAIpt8giiC4nPmPSv
         dbqbw+vy1mJ9yGzR8bParCyWuc3+i+WXnAAyTs9KDslwmQbUwoZnS9ztwDFYj0VjB1td
         IubNc1YQ9VxJJTJvSkZCkUsOtMh0/m/YsL/A33Va7kONE4FkwRAYDLYQKYFjyzkQ7DWM
         /2UdIKZZt4d3Ae48CmCU6qHKhOwSzVU0VCfKQKVyfYiv++OIxc0ZsSiWeKGXFXMiWKeZ
         lpYQ==
X-Forwarded-Encrypted: i=1; AL+hErGho3lIrzSZrs0fmb8lBi5Rs+J773MdN1EXETqMU7V0xXyPqdeD/VYwRbvTcoCaWZTujF+onH8Imf/o6QQRSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9q2WJ8XSg1MXf+3g9n0cy+oyUC1tCqK759Cm4OEwElTwnC4h0m
	LOoWzJnGA8umuWr+uWoheoxBNiB+k+Ew2fWGTEqiywsXTlSypmpnXimz
X-Gm-Gg: AYBFou3RRwOYlwfRHiWzLkVxNIRQry5fE2KnkyyrS881DXNNgZu2d4/QarxErkz5ULg
	WTOZFWQCsvCNx0tGbzvCl6Tb3CWDQEjvDKAqYQa3PfvLCXUvbBuhF9YK5EIhaqW7UbGqNDLgZuJ
	3XiQYkYCkoFEAA+0tbVHOJw6g5PSRvuo95Jq14698hIOpvg+l3DxAqW0N5u1o8G1+nBDNGIhC9W
	N67ctqAKQP7qTl6x0adscebYurkkTrRYCAcv/8OLKXpYtHyx1qGkqmPa1GJfvoATx1iUGJasPO+
	EHeyPfypqDq0/f80bMVUn0mECr648w2XnEdi8BkGnXjXw4FqqqxGDDsdLl5B3fvwLMF5ayLDjRv
	/KJos3R8PiZm80IlETSRMRCMDh39MfFiwmrnOyoWxbcef/lE6Ig7+xsHrQw+LQQPRmVF5ClVs4U
	Cw71Pl2gP/XJOVSWib8B2jTeUdYOz/kN0/E876EzvDXFo26FIOjPKYMExTmhJ1SBe5d/MQOinDi
	7gV/AMssqsSPC8E4vCfpBTcTg5T/fypchbdLSAVq631/wxpQlxCTUiI1jLBMoMhCcU8GuxTP4Qj
	A/LKO4qzoFvpCmIAEbxPye9QxmL2FWexEaQRlDx2i+wdPNvKkeZffBJm
X-Received: by 2002:a05:6512:3e27:b0:5c1:563f:ff23 with SMTP id 2adb3069b0e04-5c15d601ad7mr2222508e87.61.1794481349384;
        Thu, 12 Nov 2026 03:02:29 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm15814046f8f.25.2026.11.12.03.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:02:29 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] wifi: ath12k: skip the links without a radio when a scan fails
Date: Thu, 12 Nov 2026 13:00:08 +0200
Message-ID: <20261112110008.1229-5-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
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

ath12k_mac_vdev_create() clears arvif->ar when the vdev creation fails,
and the link stays in ahvif->links_map. When a scan fails after that,
ath12k_mac_op_hw_scan() walks all the links of the vif to clean up and
dereferences the NULL radio:

  ath12k_wifi7_pci 0000:01:00.0: failed to create WMI vdev 1: -108
  ath12k_wifi7_pci 0000:01:00.0: failed to create vdev 00:03:7f:12:34:56 ret -108
  Unable to handle kernel paging request at virtual address 0000000000001508
  pc : ath12k_mac_op_hw_scan+0x9cc/0xb28 [ath12k]
  Call trace:
   ath12k_mac_op_hw_scan+0x9cc/0xb28 [ath12k] (P)
   __ieee80211_start_scan+0x4e8/0x6e0 [mac80211]
   ieee80211_request_scan+0x10/0x1c [mac80211]
   ieee80211_scan+0x98/0x14c [mac80211]
   cfg80211_scan+0x50/0x1f4 [cfg80211]
   nl80211_trigger_scan+0x694/0x6cc [cfg80211]

This happens when the firmware crashes a second time while mac80211 is
reconfiguring the device after a first crash: the WMI commands fail
with -ESHUTDOWN, and so do the vdev creation of the station link and
the scan that wpa_supplicant requests next. The oops leaves the wiphy
mutex locked, and everything that needs it hangs.

Such a link has neither a scan to stop nor a vdev to remove.

Fixes: feed05f1526e ("wifi: ath12k: Split scan request for split band device")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cb41b8b1d3b..49cb9bd8dda1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5889,6 +5889,9 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				continue;
 
 			ar = arvif->ar;
+			if (!ar)
+				continue;
+
 			if (ar->scan.arvif == arvif) {
 				wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
 				spin_lock_bh(&ar->data_lock);
-- 
2.43.0


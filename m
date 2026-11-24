Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542392;
	b=SpFZ74deb2FUC6Oorhwt9O6gd9KNr4qWJNnB9z1Gzr5yX/ghWtgl6w0Cb3ygEPSfzOI1
	 /E36ITvbCeZGoWlktkYCLMhieakRJOkFJZiG6JmQdY+mEB2VFYbg6AxK7k/mwKUC/zvIn
	 mfpuyA22LADBsXL9hMGDLHxs4aDd/SCr7IHB5M249GJBFdjqzbIqfOfaFB8cwV8Gg9xvn
	 yLyTbEdVmojDK18fCgILmrWrRuL/4+kF3VwvCYmUZsI7Za/8k/a7Hubi34odL+HxTjS+C
	 5SK+edJXUdmrDfeybmuWvyGRiee9uah6Z3KJ3whOipRu8jGU/TGFpTvyDBEtyZ9kl0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J7dP3VXODxvOhlIhNJe3oI07fAUOlBnY4o0etILQ0Qc=;
	b=iH/q2q4/tET9m+UDvjPySTDbnjcMoc6GTUql6YAAX8gIPQCWU9iJR4uRQ4g01kYrEaKH
	 zxVKo+kld4pnDEnugDc4ll33lfQb7dxrKjg9K1NN2BpnNDi76ktjDaB4soIWnl4cGLFlF
	 n8Tk323VmpDQIIu2podjuYmMJ2hKGAKi2tr/cyC1or2bPFE8Zb8AltsQpmF1IgOeqsEUJ
	 QXXgBZC94O7P4+VzgADLlTGR/lAs9AE0iylQc5otfQSxUsMwazAuKAkS0PHqL3dCpv1fZ
	 YvuE9NsHX3bclSq9s1Zn7gnn719aYD1ELgsmEJ9i/gm67RqR4hcdpTCSXmdG7c5Xhtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NDTZVDK/";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1817606A333
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1817606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDTZVDK/
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so2876105f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795542390; x=1796147190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7dP3VXODxvOhlIhNJe3oI07fAUOlBnY4o0etILQ0Qc=;
        b=NDTZVDK/M5vxdxtSwP1Li0Hjpknc1RCM8i347pZflqzsX3rbzen9SBKedF6t5ycs4L
         9xCS3UYx0vbppq+XARgVPXY6aZZis+xzthTdyPY8Iv+t2j7iLeb0TCFNJcGy5pDNbKFx
         yDxcoSbA7eqzxJ9ad5jCJ1LrAOasagqN3IobL/Rxr3IxEABRULBkm6azD+uWDi1mbCen
         8jUuqkOlW41DxMW/LZFRql8b6kfFHqU+vKRfuOpLYBIWNKjGsx7Ixg1dCdKZnmLZIzxZ
         07ddZfHucLNb5RPxYYmfv/iJarHOb36oGlim9wcWauLGbodI8R1y0E/8WLhJyQ8xacgZ
         xMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542390; x=1796147190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7dP3VXODxvOhlIhNJe3oI07fAUOlBnY4o0etILQ0Qc=;
        b=LQzpmM3Q/T45sp+57gMhaXsJN4ulPD+R9z3IZfJtVXetfQZBB3sDODMPPOA0g5kbty
         PtdyhIES9DccMzNVsEFhrZkZLbPBBSbaVBZ4LwhGPzELCQ0nI02+LNwKfTqh0fk8AJS2
         OJEUSDFPLE2QkfpTM6V0AS+l4oWnbLwieOJcgej8Lk9+su4Z9VqJVp9xZrMLJQAs4Ogs
         Hc+tLwHTRCikW2PLjFfZfzlGWmoRfpwEDtHO6t7iGJNFBaeGeul8ZdYTORj5KlFNmjYj
         wXQItd0esUpMRaYwLzRjlvlftBCbnkTObeVyZG97OV8G8+UNeNKy6gskrT7Zg7AQ9Oa2
         NQMA==
X-Forwarded-Encrypted: i=1; AL+hErFDjQdsgoUp97SAe0ngbmMo3eo5X9SinCdVRp0We5F7T+DcGcY+4D6G7cGaFK0/FiWrwdkrXpyapeGGcGwOTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+X4gFk+uQOh4XpC3eCVE3mOrCk8+ziJWYF4t1PMmKxFkbGtxWy
	O7WzDyb8vNpjqvkBFhyOO064CQh5hhH8kYO4PZ+mP1Ant5JAreC/jIA=
X-Gm-Gg: AZFdTZd7zQvj7sg2R0SeGB0LGnXLG0x6VFhfcuAYYhf9WGOYep95iT3bmJECgi0XXdF
	WEtwC1yfIesuIC+sOW/diyZON2Ro7yKL7/Mknx/pe5yeIwcWLGqihWNo4v+HJ5B1irDftGxfHIK
	/lmdDgrXRdRx3AejoCx/yxkPYngm1wI1UV0J3DSbLdKZvkfdr75sOnreqQDziiCfzOCZUq35D6Q
	vN+zRfi8VRpurnVNRLfd1SCNeOTpBginfghrLEawmLkYZlDcvlC+aahUxcYlQ54nGQUzVeoDP2+
	WLMU7uZhOUVPqhND0+8EbCXqB336gjcCaL5R669hzn8A67m/OM3rybg8CHyvjyPJFU1Hw3py6DF
	2gHsJq0U5245BK3nSq5Omz6dF9HYD26e6yQM+nViewbHmn/ihJF8AaSNLhNx+Bxa91oHXJc05bV
	L94NCKDRX5RKZ+YUk5VSZ0vE3n0gjKGB6Il0L5u7t37QsUd9dsvyE9wSm0FCVmQqRuMCYCh/XPz
	76Vd4Zi5eSyNk6RYZJLeR9tr7eoS6umBf3nw6HTSJyuPRs1AJl1ZANsfw3bqYe9YOkiUTXLC+SP
	i8yTXqplbnV2jD8=
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr305609045e9.35.1795542389963;
        Tue, 24 Nov 2026 09:46:29 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm413261165e9.12.2026.11.24.09.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:46:29 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 2/3] wifi: mwifiex: validate intf_num in multichannel event handler
Date: Tue, 24 Nov 2026 17:46:19 +0000
Message-ID: <20261124174620.1572200-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124174620.1572200-1-tristmd@gmail.com>
References: <20261124174620.1572200-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The intf_num field from the multichannel group info TLV indexes the
flexible array bss_type_numlist[] without checking whether it fits
the TLV data. An intf_num larger than the available data causes reads
past the TLV boundary.

Add a check that intf_num does not exceed the number of entries that
fit in the TLV data.

Fixes: 8d6b538a5eac ("mwifiex: handle multichannel event")
Cc: stable@vger.kernel.org
Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/sta_event.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/sta_event.c b/drivers/net/wireless/marvell/mwifiex/sta_event.c
index fecd88967ceb8..1f746e8f6b3e1 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_event.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_event.c
@@ -450,6 +450,10 @@ void mwifiex_process_multi_chan_event(struct mwifiex_private *priv,
 
 		grp_info = (struct mwifiex_ie_types_mc_group_info *)tlv;
 		intf_num = grp_info->intf_num;
+		if (tlv_len < sizeof(*grp_info) - sizeof(grp_info->header) ||
+		    intf_num > tlv_len - (sizeof(*grp_info) - sizeof(grp_info->header)))
+			break;
+
 		for (i = 0; i < intf_num; i++) {
 			bss_type = grp_info->bss_type_numlist[i] >> 4;
 			bss_num = grp_info->bss_type_numlist[i] & BSS_NUM_MASK;
-- 
2.47.3


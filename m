Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795849455;
	b=KRhJ6LG4QkFznV9ipBGnxcWzVtA7ZSmmwO/MxJOYR3L5tvQuPtXKJ0ufvdFJFzE4O0rm
	 j0b8oUEykuTq2wzY0PyT5DebdC5DPkA4B83OImoeZdQk+b3GIFb66Y5Y6M+uhHk9Cq0vj
	 Q9eYK2XtxuUEZa47OuJF6KeyWEcFh16+ZGv0yYuHqC+oU/lGFl8VowK4ItBOU38zXPaJ7
	 URTYgVxR8MeEySgGb+e1Wik1xySLjSKcxy0vPkN5ODK4jNtiN6N5u3tpIvtWx4VETlB6r
	 RokXxEC6kyRE/NMdzV96VlWCqQlAFnrD9aVSu1AYpPjbs4B5SPMchD52foJmlUSc/ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795849455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GJn+E48+XVgnVBvetPzGB6qYvdIrlD3EnhcyJOFwMw0=;
	b=zuNLaogea2IU9QTXLrtWarM2YP+1+mQvGPX1bFTdNQc16yPJL2igMvaAWrSIW0ZNZP5g
	 axYQ2O8SXTkLMab2QK3DKZJDirh83KXctEKKR4JgUbZzyVokJE9AtvxpUSgmrHaQaiZkB
	 vv8yhmQAELzgxwRRBj14iC7WDNQJoHNMhEd98nYSl6Jiu9I6KnBcXAOLBOCNxIl8qqPQx
	 tGwLwmGTEh+mt5fZeevDIL1TqUU5srmIbL2B4aYrkNcBhKMMsnCWvnsxGfNsGo0kmzhyb
	 vQwBGf+p8XOcwSf/JPBHcJP8COXXdgD2HbloNjFAGVsXFgDEXfUpRZBBdazYEtgAE0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifYmDcGm;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D60606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifYmDcGm
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b5786e099cso7836527c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 23:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795849454; x=1796454254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJn+E48+XVgnVBvetPzGB6qYvdIrlD3EnhcyJOFwMw0=;
        b=ifYmDcGmWbXoVxKPQjCTUNaCC6+ybRspcrh3y7+HoVWu+7wuJLY8BasKz4urGYTtcN
         +HeMI2JyoxO3cIn9/vK4v+HFhXRpeTLt+6OlcY6rVhtLWT1Ha+cU0LuSXE38xAWPYgUV
         uA/0Y1fgwdLKh6p4zfMmYxOXB6df0ajmha9IpgbYcc+WYi9ckEXyJKTLXVaxmT/4OyRa
         icFK4YTXesnqkA+vHjz3uQ3Lbu/U6cwefumisdZQ3oLd8niFo43ppv2RD2vbFN6LTsty
         /M/sO/NtJno79HmTzkBgg60oiSm4Dajio8FGticQ2iUn0NwOH+J9bs5mHYtbWjspdQLF
         BnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795849454; x=1796454254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJn+E48+XVgnVBvetPzGB6qYvdIrlD3EnhcyJOFwMw0=;
        b=IJgkZk6o/GVW1kvkQs8lYdTzJqKwnuuWo/0gTOgdH4GFquZ6ZDEW8tOaoh4iCkHZpm
         iIaK55Sg2fdCTZWITQLks4bkcpKjmRspW14rCaDiZ9GLj9Djjt+Q6NDytLTCgo/cVJmA
         uHkAwWtNLWa9I6jzCj8NnIiKwMISRietAC5BK8isOuo1SX26QEO67e1pPNL/uyEh3wqZ
         mxXoTo/OubhwTYzGYBCF7TFsTQRSevkHuKFNmgOfrCUn1ykGXgRASKPPU4RWc4iiJi4+
         gdhS/9gfoLr4WfVJsCu9LYrZdfuEWd8HmtUcSa6iL4rd8wD4OYvtfwfx9Y0F1PtrWxbA
         gAHA==
X-Gm-Message-State: APuU4Z/+8Qt9M4KLK5j/KBgVJzlODC2uGZsaYs0d3zllN689E7frDBoB
	8LG4DGFidYgK98dVmnuje8GJj6jxvfqU91nY/2P9Orv1N3AW4V+KaXfLZibGQA==
X-Gm-Gg: AZFdTZeamCYEM4z9ymQFIvQ25/zrQju7H6tvQcCO5avJhqfgRab8FbpRNjuT0s6BCFZ
	Xxx5ETCurB7MNzXp9Z+LHjSXM3ZHDlt5ldw7w/w7Haajx3JcNpcP61NCcaAM0rPZbWR8g9Hbqxk
	auBG4BpyfaFMZinhhi1sie4xniRqR6dinQIABZg4WMwev2wEZfIGaPH0/Y8xADRtBoDhj//kNfj
	zri4LxfYsLycUBb6NeARc9NVSRi3wWx2PLTLAxrY8TGFFlJfkas8dWZ7SqXVtxhWGoHaLv5M+aD
	lWJFxEhTBH/C0pG09bHk6/imUG6hkzPH/svMcygck85V+uWCf11vOxW8jSF0GwQHUNCAKdGoQtP
	1cwCqF7SQJoFUWC8pR5rq2ofNinLqZYuOOxlB+e5KjNZjdULMwfDOuM5WWInxHwb8H4+2NEcLGt
	ARSz5EEei9ee4JT6JDrSl3V5alc+V84LF3tcFu7rwJegs6hr33rrDl9rP2/Jb0zWK0cqceLLuoq
	6xyyTnyWogAT3eUGRxJaaajG1BUEPhP9CAeZHw1YlRAvOm/WdKXLflO58X5mVcFb+CRIekMNwi2
	+q8ekP77mJP8RmZYOGMWgUR01QhHdTtGz9sppWXqZ/7ofyndGfI=
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr27435544c88.22.1795849454193;
        Fri, 27 Nov 2026 23:04:14 -0800 (PST)
Received: from tach01.nordicsemi.no ([2401:4900:1cb2:1222:8ca1:bea2:3bd1:958d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm54740763c88.4.2026.11.27.23.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:04:13 -0800 (PST)
From: Chaitanya Tata <chaitanya.mgit@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Chaitanya Tata <Chaitanya@dotstarsystems.com>
Subject: [PATCH wireless-next 1/2] wifi: nl80211: report why UHR capabilities or operation are invalid
Date: Sat, 28 Nov 2026 12:34:29 +0530
Message-ID: <20261128070430.3784598-2-chaitanya.mgit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128070430.3784598-1-chaitanya.mgit@gmail.com>
References: <20261128070430.3784598-1-chaitanya.mgit@gmail.com>
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

From: Chaitanya Tata <Chaitanya@dotstarsystems.com>

validate_uhr_capa() and validate_uhr_operation() return -EINVAL
without setting an extack message, so userspace only learns that
some attribute was invalid. While the 802.11bn draft is still
changing this is easy to hit: hostapd built for P802.11bn/D1.5
fails to start an AP on a kernel that still expects the D1.4 UHR
Operation element layout, and all it can log is

  nl80211: Beacon set failed: -22 (Invalid argument)

Set an error message pointing at the attribute, as the other
element validators in nl80211 already do.

Signed-off-by: Chaitanya Tata <Chaitanya@dotstarsystems.com>
---
 net/wireless/nl80211.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 8a5c9dd9d0db..af14bdcf7c50 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -548,8 +548,10 @@ static int validate_uhr_capa(const struct nlattr *attr,
 	const u8 *data = nla_data(attr);
 	unsigned int len = nla_len(attr);
 
-	if (!ieee80211_uhr_capa_size_ok(data, len, false))
+	if (!ieee80211_uhr_capa_size_ok(data, len, false)) {
+		NL_SET_ERR_MSG_ATTR(extack, attr, "malformed UHR capabilities");
 		return -EINVAL;
+	}
 	return 0;
 }
 
@@ -559,8 +561,10 @@ static int validate_uhr_operation(const struct nlattr *attr,
 	const u8 *data = nla_data(attr);
 	unsigned int len = nla_len(attr);
 
-	if (!ieee80211_uhr_oper_size_ok(data, len))
+	if (!ieee80211_uhr_oper_size_ok(data, len)) {
+		NL_SET_ERR_MSG_ATTR(extack, attr, "malformed UHR operation");
 		return -EINVAL;
+	}
 	return 0;
 }
 
-- 
2.43.0


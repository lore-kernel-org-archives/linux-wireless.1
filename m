Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110612;
	b=FSsahFfnxXfEHfqmbu4dCPQON0v3VDITXaXGsVqSrhVgEtNhW5tu0Y2RI+A/oTDmZ1+n
	 IBseFuUYnbpyylexmqQxwOQ+Brd2G78Rwu68SUuEfk6RtyMH1hhmhO+lsWnqwxwvIQ0AZ
	 B430ss7qr7ydCeNGT61DkldqdUAig5VtVvyBKF9hD0Rgx0wMQZjtI7eEzYQM74XOmaxUQ
	 KCFJYMLC2ch7HrrvjLBo56OIZbd6OHPyzgC4FAr/Z4Zy4UpZoXYwOfcbWWlWGT0EinhBp
	 wc3yvBNF8+xe2eSgAs6CrqRTMjnupl8GSirH8MBWr8QyEwKgykAe1eQtKV3ug2XsMag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
	b=H90MjHoooa2nVSoJGO8yb9bb7YHqa1mNeMaT6AAkQUfJb0ETxeTTFKdUzwJ05VRrYvE1
	 K12d788Lcq2AqwJlgrq6kaPUlSypwDrFcRvFLRNxejHeoLAmhBtFPLIvHOQImTijzkMnP
	 DarrwG2tpJ8lwV2FJnCtiFwZ2BFw8kYhHokd29QNiJCaGBd0MqTqOhMyEKUKEbI+gNvuk
	 ZEPX7AGzdTuQ6jLNheUaLBvT+SQBnSiaT6jZqTNYWO+R07xEbr8NnqTTbbC9vkBGXC3z9
	 DG6WS0ZgQBWJqnaip0+C20yBNgtZfW/fbrbU7GAk/HeJdlHb5fNJIUEbjr9QgLcL34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=noXf1rHX;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC26606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC26606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=noXf1rHX
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so27641555e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110609; x=1795715409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
        b=noXf1rHXHVA5Bo4zBqtRn+YjTYtHNXGVE83xggHGKpOWjneiUdG5LTFmE9tzs3PcFi
         QDgwMI0eZzahFKbbUHQxOzro7v4Hw3kiJ4m3AYRUtEkI7RUatHAETc/wADxUDy48QzWy
         NltjoUQNyPz91+WrQGjtvuHrtGTA7HQakwoozd0ncQc5831PnXftOw4lhkDLw/7sDU2A
         5cF+ssEbbYVFSUwmA53rpP3GVOutHQ/72+f9fJqIRZo1Deuv6sQUSQjSD1ZU8RhziwLX
         M6YNfnpf2S1ZK5CHuPW2PZYCZ/XVkE7wLBdZJYg1Er631mnNtAF3hoy2QVU+0gJo2z8X
         JXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110609; x=1795715409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
        b=moW/n6Y8hdnEvYuhpVdkvz45rShnN3xP3pzML3xqcWDXXWgVbM6QX9lwKmho8i5TmI
         p3etxLj8hlXh5UEnSWH5R116p2hJ7HToAoOmYJ43Mnq6tu0NroyIBynvqCWbLZVyVo7O
         wk+Fg8gIrRfgrZXzb0nZsYeReHeHYCWccZejYklflUovVEgaTBzafwSMtR31V8vf5ltr
         +x0CB4vCaUPT7jN5oA8HEyfbiCy5RcUU8ZzNxAQWVlJRrp+Z31UHsPielZXSazasZi2X
         M5GXS4Qy7El3dsX7jVKCb7HC05VD3ZTKfa+lqXAALprYbIolT7nIOrWhzPtiIcG/W0kZ
         K+lw==
X-Gm-Message-State: APuU4Z/+mSt9qN+SxFBfU4ExsejWgj6tdKP9daXSX1ckaJoSI1QLGpIy
	oEkfj7+9u5q5l1qN7v6i0d1kgRTPFDiyFuJh4Ewnw14ireaPkSVm4FIU/Hl1Stg2EjgvSDOgDHw
	jXmsnOAA=
X-Gm-Gg: AYBFou21uUWgl9MiOGq1yra9LcF54l+XJSoA4lxz2SIKlbz2cNclntpzX6OvfKmzePI
	2Fhz6vWVr2SkZ0mildOUVN4AhqiNaTiIWMLeHtXbWanLT9APO9SV1av6KGmLv8C7AvJoz5kpd41
	37qvQw++ya19oYAQiNSg05Sra8THHEwBQzMdxpqBiZBjqQy9hz+djNCsPLRQBdGxPsFgnDpeMIo
	JyUuO2AkDslF9hR3g/j54QKWQJ4Xsn9S3Ps90RWZKpwA75UAr8QMheIXJtvRCFy6RMtgJ8tzNhz
	MZT58+6gxGIrKcaym+xVlNtirXeBdoBoY1qy8BK/Y58D8appJ9X44dNiYTfqncC4b1TbqC04fJO
	WNwfmEZRZwx3IpwtHeoOvNie36bmahdruMs612Ykk7VQVtQbHL8Q+8KxAluAumR1tTWwr7s0XwX
	BU/NzsCpJeNPxoxNS5soUkoAHTOkys71DzS91tL8GGfu1KYX58ueRTk39ng8O7KHtoXOVg5UMzU
	4/VclpcSEaQ62vpj6Oa6y3qDtBMNCvoRFVGFV8Nagl1/eD5h6LbLXZNcJWpcjqddIBnl5wlzzVT
	PZH1tUs66aELckYM1MawedL5HGQhV+39ktLt3xh6zKNn/cJ3X3f1vop2qm/y1If2YANsr1gpKYL
	3fgtLXi80yvwHc5oq7+0fYjgIKKd1+l/5iJ23xZzh+/qxlajVFFOXTEtMgKhJ8XrrNnh2hgth2A
	8Hfw==
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr5216045e9.27.1795110609383;
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm90730215e9.2.2026.11.19.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 01/10] wifi: cw1200: avoid removing the debugfs directory twice
Date: Thu, 19 Nov 2026 18:49:53 +0100
Message-ID: <20261119175002.458988-2-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

Unregistering the wiphy removes its cw1200 debugfs directory. On SDIO
unbind, cw1200_debug_release() then tries to remove the stale dentry.
Leave directory removal to the wiphy and free the counters as before.

Prepared with OpenAI Codex.

Fixes: fa8eeae10257 ("cw1200: Remove "ITP" debug subsystem.")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/debug.c | 19 ++++++++-----------
 drivers/net/wireless/st/cw1200/debug.h |  1 -
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/debug.c b/drivers/net/wireless/st/cw1200/debug.c
index 7dad6d3ba239..6b8b6ca35103 100644
--- a/drivers/net/wireless/st/cw1200/debug.c
+++ b/drivers/net/wireless/st/cw1200/debug.c
@@ -359,19 +359,20 @@ static const struct file_operations fops_wsm_dumps = {
 
 int cw1200_debug_init(struct cw1200_common *priv)
 {
+	struct dentry *dir;
 	int ret = -ENOMEM;
 	struct cw1200_debug_priv *d = kzalloc_obj(struct cw1200_debug_priv);
 	priv->debug = d;
 	if (!d)
 		return ret;
 
-	d->debugfs_phy = debugfs_create_dir("cw1200",
-					    priv->hw->wiphy->debugfsdir);
-	debugfs_create_file("status", 0400, d->debugfs_phy, priv,
+	/* wiphy_unregister() removes the whole subtree. */
+	dir = debugfs_create_dir("cw1200", priv->hw->wiphy->debugfsdir);
+	debugfs_create_file("status", 0400, dir, priv,
 			    &cw1200_status_fops);
-	debugfs_create_file("counters", 0400, d->debugfs_phy, priv,
+	debugfs_create_file("counters", 0400, dir, priv,
 			    &cw1200_counters_fops);
-	debugfs_create_file("wsm_dumps", 0200, d->debugfs_phy, priv,
+	debugfs_create_file("wsm_dumps", 0200, dir, priv,
 			    &fops_wsm_dumps);
 
 	return 0;
@@ -379,10 +380,6 @@ int cw1200_debug_init(struct cw1200_common *priv)
 
 void cw1200_debug_release(struct cw1200_common *priv)
 {
-	struct cw1200_debug_priv *d = priv->debug;
-	if (d) {
-		debugfs_remove_recursive(d->debugfs_phy);
-		priv->debug = NULL;
-		kfree(d);
-	}
+	kfree(priv->debug);
+	priv->debug = NULL;
 }
diff --git a/drivers/net/wireless/st/cw1200/debug.h b/drivers/net/wireless/st/cw1200/debug.h
index 80bc1567533a..339a375b4c18 100644
--- a/drivers/net/wireless/st/cw1200/debug.h
+++ b/drivers/net/wireless/st/cw1200/debug.h
@@ -10,7 +10,6 @@
 #define CW1200_DEBUG_H_INCLUDED
 
 struct cw1200_debug_priv {
-	struct dentry *debugfs_phy;
 	int tx;
 	int tx_agg;
 	int rx;
-- 
2.56.0


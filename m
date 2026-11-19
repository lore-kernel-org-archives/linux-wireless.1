Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110619;
	b=m8iW7GqOVLDgjyrae9gydK0YMmqAL7ZzM6CJHlStDezpMP/piBzxZ6MYXpO1RSgiA0bS
	 rDs6lBDr9UEtEy5SioQ0/D3+G1Q5WHGhseUXUxtpZf5Vz0xLSFmXJ26P/JaH2XhIAz768
	 05X5/Ob/MQmkq0MGqknfyKUbh2RJUMGLNx91IkKdXK8OtAga580ybNoulbN/8VPLdmGyO
	 k8uS1F0wEp7LmovraFxEJCTUwlIrs8g+bwjmJRfZ10yOFLgk89yASM+q15VUQd5EhZoRE
	 9a7FvSZ3+9aq9HSE/JMPY5UeyxZ1+gGOCcXyv4lX9RjdL2FA1Ey3qrS/6fDy0DRJN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
	b=0yoPezfoL38gGVLP070g4CeLsh4jScBKG4PN+qiYwjUT2t9Pq9vZpIOSKgd7CBK2Q2V9
	 tSbOi0uSB7TcMCNo+J9tAH1DcCZtXCGPdFKmqVRBc4V4YV+mQOpCt1VhJWzzH4mmaMp0R
	 hVCNEAtHl35r9BKhH0jTNGilspXsAZkyNpwHW7Q458TDV3BBmYfoh+HqYVNgCuWnMmtw9
	 cc2lLjzrr5Wzm1dvMIYwNwD91L5nP+JxLJ9/ks7szB5UqomGX49yWUvKGZ4zYrX5C7EQR
	 lDAt7VO3KMEABuGqrUVud/8OhY9W2/RSHW+CgPInhCjFh4pkJgamEmhIIuNBtWgbxNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n8OX20cE;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C060A262C
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7C060A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n8OX20cE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25092415e9.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110616; x=1795715416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
        b=n8OX20cEK3rax+Ru4Z9EgjrB3T4PAKO/53cZnU3yUjRICzEumHI2YCgRq8WNLgRpgn
         OBHkOALaNHdPMil/CNWAGiKiOqLJzmAMh7ZLFtTDEkCKr4fTbnk2bFe+qlXX8Pyz/2+b
         n8IwyJ9QPHfScy+fZ6/4g/8G3Jc4L+bQcFYrMWcFzZ+a4hTyJ9aK+UDSsKfFgxwxBqtZ
         H6w37pNrqwAnN5wDR8kZBRVz0NJbbVETUmjr6wxwH2mNq3r2m2fLiDnEB306wyBEa9ke
         zTEVPvI7K/nreNvBST4wY2esXHwEwn9Xszabzl/pcUNtIHTdrM++u1rwURLk/NH+36mR
         Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110616; x=1795715416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
        b=V98+sb4UuAODZMHU/lNg27yn+LyGLvhjjs+FR9luJxTz3LLsim10B/OSmIy6wzB6Bz
         3Tw3UMsynp6tmp0T3YbXg6Pymc67qrVAldmttNKFZBf1kCpYHXCEF35CDdRsQoIaWQ6J
         k9/M8DOvoKQpPtYJBbDtIr5wKHoNicH0DbdCT61PycDwZQOsHHKL7HUMPNTDM4tnyylX
         PcUIiJUTcqikHgr5FfRfHGqwhBcv8y6qj1nGN93Gab8hLgi3lnOgG4nR/PkWrUFUUqV3
         RbvVU6RvIQ3CC7MVfycMO7Q3egv4JU25FXBzPM+3iqiYI4aA4cOMH7JQscNBzj05VZZ8
         WzUA==
X-Gm-Message-State: APuU4Z9wBH7b3vd0wt6WtnzQwAENdBqeXwjDpfLWzCJABSYVmUSLI+SY
	x38jj4JIpwke79akdtj7FV7fpyemB55IcjBMeXuDipWoUxkN3ekpznKGkDFKqqTejb8EoLOzsl2
	R2yZ0mzk=
X-Gm-Gg: AYBFou1MUnJo8hIJHG83AUXmbjKUCft1SJmU9lq3VZU0LP01rpTMfB/ZScGvtEilALh
	iEwjsjop3u4713X8ptjWCk29j8mI0B8EPSUh6BlRsqWtu+ZRKo2X1kKQtIQ5NL2wwF5/HgGBnhx
	m5+qaOTgwWOfsMSbwGNgb0t7I54bE9XMaPwc3u4qtgDr8zXVbQ9KU7YGEPYqtMD0oLD7WnrD0pr
	wZn46pC5n0w7yGOLwMiF99FdgY8T9oTqBcbNBOZlXZlUrzw8Z+7cFoFSX3w7Z/G0Zbs5tVejqRu
	mUKeInHQ5Yc6a2kqPW1qTEC2RbvSMMK4dc1pArhj0OqEUEclxqJG7ReblCMOHIMa7jXOjZK9Ox2
	IPn4z5gda6WQDheNU+3Jd2+x3l3InTfSI6Hl6w6ymxweEUtEHGVRDfrigxclHKeUkv9nqVfg9nx
	0eYGUXsfYzLIMmDG8WvVKws2h3QcTCblpSSaqNGZ2IPWxcMNT7ME8iPp49DYJhKDBI4c9faMejW
	oNMDDQ0LKD0Uu9sFqXVQHR+fDuM1Vipwgc77BGXQMeZilALiN51nmQ+qqAdYaWhfbgGqBir1GQd
	X4p8vPYVSfdKfy/6btXwx56b+cAgqwMw245AFYKws8WsfblQfHbrizse6ZA8huF8eafX2e38HHu
	YLWK0ZMwqTuHD+2Dz6tZMn1KTvI4oorLn3SRLRpCBpadllR19aET6COlKHiLWKT2RfgANkPQTJX
	Z22A==
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr7534355e9.2.1795110616543;
        Thu, 19 Nov 2026 09:50:16 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm66709165e9.0.2026.11.19.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:16 -0800 (PST)
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
Subject: [PATCH wireless-next 10/10] MAINTAINERS: add myself for the cw1200 driver
Date: Thu, 19 Nov 2026 18:50:02 +0100
Message-ID: <20261119175002.458988-11-arthur@aheymans.xyz>
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

The driver has been orphaned. I am adding XR819 support to it and can
look after fixes, so take it over as Odd Fixes.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e7b5f6beba4..3ee6e717bfc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7209,8 +7209,9 @@ S:	Maintained
 F:	Documentation/process/cve.rst
 
 CW1200 WLAN driver
-S:	Orphan
+M:	Arthur Heymans <arthur@aheymans.xyz>
 L:	linux-wireless@vger.kernel.org
+S:	Odd Fixes
 F:	Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
 F:	drivers/net/wireless/st/
 F:	include/linux/platform_data/net-cw1200.h
-- 
2.56.0


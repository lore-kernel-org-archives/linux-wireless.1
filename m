Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.78.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647364;
	b=qDHg8j0zjAaG0VQllNaEc1espn5Zj+wRAebfGrUDI5jRlsgivG1D20rfxkYg0i697NY8
	 XlK+Db5dTcbCrQ3yYZAnSxg08Kz7HXNrUo77yANLKvY3IaxrAHRdp8097J9C1SkhQFB87
	 HOORQhf1QaJpiGTX0GHmZYhngLn8r9UweWkfcoE70LBGU/2c1CAYQY5HvkVAsbj0SowFj
	 hjdULCELL1zYzVRBnshCYB6dzZzROyQWMHd52UWPt93z3CSqBJkceSBsGfmte/nsB/0yH
	 urLuca5c6uFSzDvAejVlyWuEhjzrDyTJsVPixHM/7gsGZYijQKJUbnSWkatQIIOTRfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UH8hxzi4C8oZWJminUZ8a/ZbhQf9xoNwmkwO/tH++ak=;
	b=CU4aih6RbIxRLaAEUBgL7lTLPyfnZtHtz8tY6i2JWuWWrmYb+t+QulgbT+9wgZOx1kHN
	 TLes6iE1YDD3CnIUOOH1RD1M9SiJWcVCD2+Cnc++wjADIhf5PQlz5YCTnBFHBlN1ndVlV
	 RRpr257CZjTHoRRdJ6qG9iFp4IsDnlg4yxejktubbHo8jFtaTJ6HnXA6ERWGk4RpJJ4UG
	 VHZCYFbXkuty3aplGpRMmqd8GYyhIngGWInDOWogpJ5pl262dYC+3K63h0t6bRg2TeB2v
	 +gzB0jaRIqY7xh4PZVvCUzpW2biVDj4fMr70rB7QVv1ZZvOGKv1fF4DICLMqy3sj/fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=VKv2f4mV;
	arc=none smtp.remote-ip=77.75.78.210
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73D606A337
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B73D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=VKv2f4mV
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 44752039ba81929344fbae21;
	Sat, 14 Nov 2026 10:08:05 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647285; bh=UH8hxzi4C8oZWJminUZ8a/ZbhQf9xoNwmkwO/tH++ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=VKv2f4mV3hVA/EqFuqkxH7a67DG8Qcyl5NskSx5h2tZQ8rYf6ITjAW0vIbn+rbill
	 wSfFL+v90aqb4E4k5GiMYLEXifag8BEktj71PNk1xVKiHw//PCj+UAorR91GkPT/Te
	 nU7Jg9WkRkBu//omM6uVKzanp8Lh6C7wuSIcvOsmSgBjoNfzS1Loiu/Nv5GymBG7D6
	 webYB9dsMqJsj4z0VS2kAxe0ipJCW0E1CxpZjaLM0uBEldLpIYpmM0lBeG/Xo0I1zJ
	 UqAv1UtbenfR7nWHkLT2ImZr+CUhgtBffEcbfYDhYbNVs5ATu6vikkCi+cgDjYfmZg
	 tX6GIkErLw7CQ==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id a59e3d33-0aa5-43cb-a79f-d4cde359230a;
	Sat, 14 Nov 2026 10:08:02 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 2/6] wifi: ath10k: usb: set soft_unbind
Date: Sat, 14 Nov 2026 10:07:33 +0100
Message-ID: <20261114090737.64348-3-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
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

The USB core disables the endpoints of an interface before it calls the
disconnect callback, unless the driver sets soft_unbind. ath10k still
sends WMI commands at that time, because mac80211 removes the interfaces
during the unregistration, and these commands fail when the driver is
unloaded:

  usb 1-1.1: failed to delete WMI vdev 0: -22
  usb 1-1.1: could not suspend target (-22)

Set soft_unbind to keep the endpoints enabled until the disconnect
callback returns.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 987d57a01ddf..c1ba30a1437d 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1116,6 +1116,7 @@ static struct usb_driver ath10k_usb_driver = {
 	.disconnect = ath10k_usb_disconnect,
 	.id_table = ath10k_usb_ids,
 	.supports_autosuspend = true,
+	.soft_unbind = 1,
 	.disable_hub_initiated_lpm = 1,
 };
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=31.44.14.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299331;
	b=qoTfBdqF1aU/X8nol/4+nQEF9oKC2ODQ1xYlLu2hYfJDUkQatO4DOazUiOq4Rn+vdyTN
	 pLvhqQf7Y6JoI3ZVtJjhFwBE6AQHREzbJVz8qw9t5z79No4uX9pfJno+pVWOW0H4DzBUS
	 QcuKvapHFmpIh28ZhZgChjV+4oEyrmTivNMOcOERx71qKDSw7qNE2xrHyyT8QRkm+/eSN
	 hNTMzcNeV+SgPIRBPyjZvIurctE3fXgTyRoieiy5GwXtgwecAQWDNjBl6RlFezs+DOWXv
	 h9P/877RPrL96ZL6krJU5adkSN2r8vZ7FbdKjpRc4QwRi3wZFvzTAJKKrYknc5QjTJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299331;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KiHYL98shVArdwp1a7ybI+gKcZyGmNWsa7R+aE+cRU4=;
	b=ExFb4U2EeWnlU/9wHoHvwS12jsW8nbEP1Nsouc/peF3kr91gSdVzn7nivs7sKJFIaWiF
	 iw9hcd9IXwDIcwZzMYkEjlN3Nnjl7vtRdwViprrD2sJZ6QvZZont/jsjqxKL6sqvPg0y+
	 liYQTIBghnFnsjnc3OjLgWyi3E/jFZ5WBmBSVBxwnGed+2SsWL9tfQ2vumktH19/5o6Hx
	 HIWVg3CYgKw13UHDmUIRco91NK8gk6wsOm4dRQxCJwfXChFhjFt+n/WoetZVw6vbk1g2T
	 VbDMReNq1wahbqirENQFwmPLbAYvaiB9LnqGx58/inCw0PMVyYSl2w21PlUv79pNtBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=GF9u0pw4;
	arc=none smtp.remote-ip=31.44.14.19
Received: from forward503d.mail.yandex.net (forward503d.mail.yandex.net [31.44.14.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07DF606A33C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07DF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=GF9u0pw4
Received: from mail-nwsmtp-smtp-production-main-62 (mail-nwsmtp-smtp-production-main-62.yp-c.yandex.net)
	by forward503d.mail.yandex.net (postfix) with ESMTPS id 1375910004C;
	Tue, 10 Nov 2026 11:28:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-62 with ESMTPSA id SSNIAJAfjeA0-bvtFO9i2;
	Tue, 10 Nov 2026 11:28:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1794299319; bh=KiHYL98shVArdwp1a7ybI+gKcZyGmNWsa7R+aE+cRU4=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=GF9u0pw4QYfWSDp47wuLQzX4V38jpQsK57Zcf4g6liAmAW83GVyb6Yq+naST1b1HW
	 +GcOgKTAeKrCwO+e+qlfmxCIN/eYWXTR36PbU2WW0X6UJl6mMzPT5R8z5RakwZtobc
	 wcCqvCXHqCK3v7csT8qpqXpJ7Kqz/e6l3uiwncpk=
Authentication-Results: mail-nwsmtp-smtp-production-main-62; dkim=pass header.i=@yandex.ru
From: Sergey Armodin <dolph-in@yandex.ru>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Angel Lindo <angellindo@gmail.com>,
	BJ Hinkle <bjhinkle@gmail.com>,
	Alex McCubbin <alex@mccubbin.info>
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: pcie: restore FEM control pin mode on Apple BCM43602
Date: Tue, 10 Nov 2026 15:28:28 +0700
Message-ID: <20261110082828.1427041-1-dolph-in@yandex.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101172011.1591620-1-dolph-in@yandex.ru>
References: <20261101172011.1591620-1-dolph-in@yandex.ru>
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

Alex McCubbin tested this patch on a MacBookPro13,3 (subsystem
106b:015a, the ID v3 adds) and posted the results on GitHub, as he
can't easily reply to the list:

https://github.com/omacom/omarchy/pull/11570#issuecomment-6745365111

All of his tests used S3:

- On battery, three sleeps with a sleep hook that unloads brcmfmac
  before suspend, reloads it after, and only reads chipcontrol:
  chipcontrol read back as 0 after each, and the patch set the FEM bit
  again. 5 GHz rejoined cleanly twice; the third time was on a weak
  access point and inconclusive.
- The same on the charger, one sleep of about an hour: the bit was
  kept (0x01000010), the patch wrote nothing, and 5 GHz rejoined
  cleanly.
- brcmfmac left loaded across suspend, on battery, three of three: each
  resume re-probed, the patch's debug message ("setting discrete FEM
  control mode") appeared, and 5 GHz was back in 4 s with no status 16.

He gave this tag there (Cc'd so he can confirm it):

Tested-by: Alex McCubbin <alex@mccubbin.info> # MacBookPro13,3

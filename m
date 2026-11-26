Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690705;
	b=h6vofCQGJrbREarW0CNKtrhXgDUYhkgIYsAKthe/B2kz1GGFbdCL7ra5s96Kla+AGfcG
	 9LDGGD1ivbzUEYE6gau1mZm/tTLAe1jHIYlOVTncEl5++y/9+MQOTm2r6xqY/QAeD66ia
	 DkzNoOmWf/pHkowoQq7jNTETXQjIRfAalP7P9vjLoBKSFHDrvETk/5besBKUJlDWcZ7Pr
	 NbEJmU6Wd1F3YIVCzVrox9A6IDGnWjyuzBTkgeCDQmX8ymgypLKcWj4vnKFx6YRV/odCM
	 eaXR91ZcIhwfAT4NLLK6wIj+J4WZEAOUIiLeVQIILORIf/La5AO5PnrBc7EyC2u4HhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690705;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=bu0jwbyS/+jRyJD/OAiryMHoauQzh3KHVPLfP/ks9e0=;
	b=fFOnnJvVTOwNmIS/yVtSXUjuEkMVvlyYxfhpOap63rI2mt5bcz13u1i0MTZWEindwn6W
	 QYAtgCZ2TcMaOIXxJRkMR+n3X45cMi5yjm13EuASsObzHx8TwXR2dnYCLvAqcdbiFBDxv
	 VQVppnxdCDVCAlPuBDaV/3FBdCc/1yRSWi6C4a75AdBbYcLg9tbb6lCYTv0nPZPCKYLcc
	 v7QUyvHtLjlqoCNmKYABvk7ACV4uTr/o6j7X7a4DEiTRShfMsg3tc2Z7Hmkc3X2siv4UZ
	 kiqNIzAfAf9O6dfgDxyxYihbWY8M/proe1mwW5yaoh554i+fOAm8o/vllSW99KDV1DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=bo+97kFi;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D30B606A6A4
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 10:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D30B606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=bo+97kFi
DKIM2-Signature:  i=1; m=1; t=1795690702;
 mf=PGdlb3JnbXVlbGxlckBnbXgubmV0Pg==;
 rt=PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:sZ6BCBQqaHZWb+tmaLQ6EgJnO7tE
   lH9ijT0JXnKr8vzT85+aJ1NbCMIeFiwba60UH9RR4j37Xur6C5S3OFE/CHxYYWdOWJAkJAs0E1y
   UtDMRmWDiVdUCD/0KR0OSo8jP4uFlkolgTWAEZIYzyFl9goF3BXj7r2PdZ5pbPg4Ja5h32vNxA8
   +82QyZd3AREcxKJ2NotvRmUtZ6q+3Uugvcd1zRe2aAUNRkqQ3Q6EBdU4OCRIwiLQn+431PRzyeF
   iWAJ5kCnH74B3YedODt8D9C9vJfxKIgu0bSn3LS2zZQZ768pPus71w2jIh1sEY1E9Ceo774GsJO
   z4x8tbG8sFulaw==;
Message-Instance:  m=1;
 h=sha256:
   aovWnbXy1aig4kMFaPU2FqQyE+om/OD4dGsOUWpdob4=:
   VVDeCrVMaRrHHu+XIB3cBMlzXe4azlk60VNmYoq3Mnk=,
  sha512:
   H2UKWnx89ZPeVpFWjTDejYt0u9QhBDmcz9xXLenkVCaKALidQ3mZgAUYSDAzy5tz6RYQcKzBobai9nVpKelkSg==:
   yyoqJ9PyKpcGEWAECpVIUpgGbFKYDDvZr55Ru+V2mdkWNFFMkytZwWtvHr/obIYbcGxZHuFNrBnnHK4ASx00Zw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795690684; x=1796295484; i=georgmueller@gmx.net;
	bh=bu0jwbyS/+jRyJD/OAiryMHoauQzh3KHVPLfP/ks9e0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bo+97kFig9jYYzYev07RE5boayXKQB4xPExDhKKEjDL05C80eASWlpCY2vg0lS2v
	 g7dnzujvS1VBH7ckonvvhgOIbxNxLkohfIp08+2T/3JUC3nPNwmOTNlTC2uJIodat
	 YuzK1+EoDo1aNZSPv8/8j+yMy7x5ajW7j4MKmhI/+3eQlp3APKxoazn6OQ0gNcEYB
	 U4zKoJ+Mv8B185EqPvKRD+wBuDPIHupPg5oXCqJ78lBnTSLP8u2NO2jVG8GvCf8SH
	 5gZ9cbxWOBXOp2BOYmKMh+s8M5NtJTwWXgAUkT0UlCtmb179tNakkNMUqnYqlsLGR
	 tfKagwViHzmoTTydnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1y34g625lG-00I7yc; Thu, 26
 Nov 2026 11:58:04 +0100
From: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
To: mehmet.fide@gmail.com,
	Jes.Sorensen@gmail.com
Cc: rtl8821cerfe2@gmail.com,
	pkshih@realtek.com,
	hi@shreyan.sh,
	mehmet.fide@screeningeagle.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Subject: [RFC PATCH v4 4/5] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
Date: Thu, 26 Nov 2026 11:57:41 +0100
Message-ID: <20261126105742.1086282-5-georgmueller@gmx.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126054350.2893087-1-mehmet.fide@gmail.com>
References: <20261126054350.2893087-1-mehmet.fide@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JFSqbzYYf0UXFuLfYerMF6vBEQLl2pIwVpU4qXbx8qGQctAqMz3
 5o6D/sb90++1UyiX/BjNuSXvejUkjKo0BNgMmzbtKnRsxDbtmNrds+i5kjlN4JSR7xrR/44
 csRNvVzZB1XIY5Q9HdVHp/1+/uYNkxtj9XaUPdVsD+gFz+P41uzPMzMYQYpx+D9KQyydROi
 yYcC2EXHG8swzF9kJ4hOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U7Hcy7M6O7w=;gvViRleyTbR+7ENXNmsytZyFd0f
 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
 zYqM9+kdE9BmmshaWoGYgOWFHBe2N9k=

Allow devices with this driver to be used as a wireless access point.

Signed-off-by: Georg M=C3=BCller <georgmueller@gmx.net>
=2D--
 drivers/net/wireless/realtek/rtl8xxxu/8188e.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/8188e.c b/drivers/net/w=
ireless/realtek/rtl8xxxu/8188e.c
index 3c887322f76b..68dc18f5b1bc 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/8188e.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/8188e.c
@@ -1870,6 +1870,8 @@ struct rtl8xxxu_fileops rtl8188eu_fops =3D {
 	.gen2_thermal_meter =3D 1,
 	.hw_feature_report =3D 0,
 	.max_sec_cam_num =3D 32,
+	.supports_ap =3D 1,
+	.max_macid_num =3D RTL8188E_MAX_MAC_ID_NUM,
 	.adda_1t_init =3D 0x0b1b25a0,
 	.adda_1t_path_on =3D 0x0bdb25a0,
 	/*
=2D-=20
2.56.1


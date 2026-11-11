Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.72.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385269;
	b=UyBjuEhfENYtsaXOGdkv3MC0DVEZLv8eN1tYdznDNrov7eBgLivqaHr3n33i3PJWFJP2
	 sXb/EyAWM6n274APSUUi9dBoqSEH5oM7p0QWqScTsv6zkLWfTdgtHDDC0ajPr2G+zLG1P
	 CUt1vy8CmXq41angHcVL/uINXNgNZlTu2UcqbFBnA2AdrsEJPclH4BubS3jQnkV37IuH+
	 PBkasuW9/itJpxZxPzQoGEgoxPgKkN5p8RpBaXladDMYO4yREtBO2Ahg/GdamzesxXMzD
	 pzFPcfY3OCTO19NslCebFTsEtgaJZ6OdxmkzMF3NoS0DLl4qJSzDuU1FMotQ2H+4yNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385269;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:Content-Type:Mime-Version:Subject:
	 From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-JNJ;
	bh=58HWnz0p8sV7syBh1H3xNmw51kSIOKEcvzUwBr153Y4=;
	b=D6vf8DBy/Q/RPRmO8UhWXCHjAmhf8JkRhZtLF+0+pg9qzSRqVwKtEzVPUsl0VuJNI9Lm
	 U8tqWd+BxorgUDItFYrM+QpOS0obixL2zPB6Q+whyEkcyjLRNblJ0OJ7pRbIvYu79NRLd
	 p5NVXJ3PDB2mnKMohaiqlvnvZ7HrUUExFNkZbhwgW7gLKm/oiOaoCCMElvdxCs3GLpZCu
	 4yhDbxJJyV6Vk0QOBVG9sE6TR0F+ThZsdFSnFCc/G++UqQIAUCi2fzjrCPZcn82XRIdWM
	 O4kSPGS4LUPt3pmBrILdXSA147XyzP2lYH9eajRUis1xJ21F0e7wnDHwWgL18mgLDjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=listopad.email;
	spf=pass smtp.mailfrom=listopad.email;
	dkim=pass header.d=listopad.email header.i=@listopad.email header.a=rsa-sha256 header.s=sig1 header.b=R5azrWHX;
	arc=none smtp.remote-ip=57.103.72.23
Received: from outbound.ms.icloud.com (ms-2005h-snip4-11.eps.apple.com [57.103.72.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB44606A320
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB44606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=listopad.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listopad.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=listopad.email header.i=@listopad.email header.a=rsa-sha256 header.s=sig1 header.b=R5azrWHX
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-2 (Postfix) with ESMTPS id 41B0F1800128;
	Wed, 11 Nov 2026 08:21:06 +0000 (UTC)
X-ICL-RepId: 01a1c9b2-45e3-7f92-b86b-583752067290
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listopad.email; s=sig1; t=1794385268; x=1825921268; bh=58HWnz0p8sV7syBh1H3xNmw51kSIOKEcvzUwBr153Y4=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=R5azrWHX6b0eTNL67PlDs117ER7CBZv1x4OZfOVVKeFRT0TH8uaRWd2PZYcYd63zbeLHH9w7NuAZg3x8pZS+iLOIZKK3n294mXWi1EJQTkTd/BtwxS9mGjwYSfkUWQSkzJctFmGepw7vzDvcnZVPLlUQ8rrMrx5KF4XMpM8Xlj3DeG2mUKJm9Ggk4i2QggC0poqM9B578FAfhtVN6nstPaKEQAjOIGUvK/sLx+5w0FEgc1lRztSD0kaQbcAwnvOOI+D7xA87SmtndHUEdSAyqqiBCRqWmVBPqvIYvQ30uiPy4aFt9gWKrEHgWVwS5a76XLs/r8bOPyahglAtikk14g==
mail-alias-created-date: 1648896822394
Received: from smtpclient.apple (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-2 (Postfix) with ESMTPSA id EEB8B1800124;
	Wed, 11 Nov 2026 08:21:04 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [RFC] Adding RTL8189ES SDIO support to rtw88
From: igor@listopad.email
In-Reply-To: <d34cd45d652f4b88a02c4795b0e1aaf2@realtek.com>
Date: Wed, 11 Nov 2026 11:20:52 +0300
Cc: Luka Gejak <luka.gejak@linux.dev>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E729C6A0-A35A-4E66-A32B-C741DE173F91@listopad.email>
References: <A11FF135-696D-4107-B5FC-BBBB05303926@listopad.email>
 <977DC5C2-4EB7-45BD-9663-69E4094EE596@linux.dev>
 <d34cd45d652f4b88a02c4795b0e1aaf2@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-Authority-Info-Out: v=2.4 cv=UuJu9uwB c=1 sm=1 tr=0 ts=6af42572
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=n9Sqmae0AAAA:8 a=BrvVWhmvLCXlDLVeFqYA:9 a=QEXdDO2ut3YA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfXyZ8XG46uThJE
 +an6jMESUaqTw9RShRnvDN+z41Xoz1tAAebbA2Wq3cK43BERxWsfDTgLLNnTdMP6kvKlaSeKHiV
 M4dUr2mQSS21eLRObm4bCpXnP6qerSGylbsQ94+ov4cD6lKaX5utYeuvA7Nwi4Ku6PvCM40p8Km
 Q1KcGDsIn0dI/1jbEjus/ZCbWHfyYfkxxbgVwke6Evpvg8vAvyBgTZROu4PIs4N58B60v3sL8AV
 U7JEi7RDuBi3fl5AgX9FslLUXMo/gu6Upbq668orK2DsriogZOxoR2JM56vPRsHOEWNJBglWFkw
 85fpbR2xUaxSfn++IPA6KwqTzOWhoF9ncMbcpnVdBUq8mR2lxsGUcG8xInGLfM=
X-Proofpoint-ORIG-GUID: WbELnREmuxmjG-OlzsBU_ogX6rLa-YCU
X-Proofpoint-GUID: WbELnREmuxmjG-OlzsBU_ogX6rLa-YCU
X-JNJ: AAAAAAABNMn4n4y5BKvfmsywZqWLoMcZFd5KEz85go+9LAeESu8dfhCf4Ix0+O5tqIHssB
 A2DXb+KaEuo9cuLarsyxkbix8xFF+Pi/v8IpkvIfLdgblpYIT+kV4cHVTEMdOhCLvdwFLD
 x52k7qdigZr5hXexPwufW5HMWiBnktP82LDctzBhJtwAFP1No4N5vxxkOMPUYhaceb1Eos
 8uER9R661uuzybu5voI5SLD6Bapxt7uxoILO/4206f+8qN1Mzif4BY0Trcq0C5gkSYClFl
 VfYmTvr26X38+gF1or7qF0rergZYzjnUPnnW9n/hIMrhtPuwXAB3hjbmhiAGx7qhqhgrlk
 URiNYwySD+l7om6FzO3ZSyf67qVm7twCXGUl+Dxgn4MeCTuWshHFMS7+FlTrjEhy9w9P+k
 Dzx6af7ytfYyXMyZNVvJ7elZ4JBG84y2lPyGVOJJnhouwQv1PEyRB9eCE7WJNq//ccZ8Uq
 sV0h5X7xbTCSnOKPOj0O6bCF62pResLYcTlIqevQvdOrX4LtL/mmz1+X93Vez4M3U2l6A7
 q9onw4pWsHrW/IK+yF+G6B9+DdEaweSDcFVQSZ1+OOJcEA7Bsb80ADqBJvAaJam48g3Pjk
 Xf6k6wHYUURCGxiFdW/hNVO4KS1UjelZ+ZoIEKqPCpGDB8F9/yd4cxd456IUCjBf1Jlw4z
 DDSvRWt7X5SpuB0QGhrlPBO59+nGRcU8js4Geu3Yynb/pDKyyBAnKA3K7Ip751qiNHPI9G
 YJCYJfMv4dAvKzZIoLEkNsTv5YMLiCSRxEdXzV2E8C5PGW0yZbI5x3SkgkpP9dez/jZy01
 wNANzQeWqHBO2SsWktlxWhOSXYJTIn9SOIO60/g7Tr0hj7g4XnJlhKULYb6kulDpIUNP9+
 nes+FhW+wAurhP4m3EP0927Rj0rUBmU2H8nAB7spaw08nOmnGrdnL1j/1Hu/gPBUflQCn3
 uEP7f415MTQFI+lpbZFyndQAhe54JBwfbht0oNWxEMTLDemElEJIES9Ymc1hhic3LYvB0f
 OWy102p1g8ZnLtXYdwABgY662Hk2fuQyDsBSVfb0fz0pbb4rMJJLO1aa3mQd10g6l1EPv0
 Dvjb5Wo0yrWg8GhAYJfPEK1ZhrFGTYa7JtjzSOchJIBMl9BrKNZpOhG+zjnkiS/rQZR0hw
 JWQZf9aLqspFGbfvRwo1j+5Coy2SImnDTBmGkLpsHi0Eicnda5ty8RF6MDcRusNiTZ9R5c
 p+91i2IdGRIf+Wb/mn2HznEf6dqfA4AJIZTXfaME+No3tkrXlxPeGa+5lQfUmiucfcIEFi
 n1qg==

Hi Ping-Ke,

Thank you and Luka for the feedback. I am reworking the RTL8189ES =
support on top of rtw-next, taking your comments into account. I will =
send the patch series to linux-wireless when it is ready.

Best regards,
Igor

> 11 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3., =D0=B2 08:22, =
Ping-Ke Shih <pkshih@realtek.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB=
(=D0=B0):
>=20
> Luka Gejak <luka.gejak@linux.dev> wrote:
>> Hi Igor,
>>=20
>> Thanks for asking before sending it. Ping-Ke has the
>> final word on this, so this is only my view after adding RTL8723BS to =
the
>> rtw88.
>>=20
>> On November 10, 2026 5:50:38 AM GMT+01:00, igor@listopad.email wrote:
>>=20
>>> Would support for RTL8189ES SDIO devices, based on the RTL8188E =
T-series
>>> (SDIO ID 024c:8179), be welcome in rtw88?
>>=20
>> I think so. As far as I can see nothing in the kernel binds this SDIO =
ID
>> today. rtlwifi has RTL8188EE on PCIe and rtl8xxxu has RTL8188EU on =
USB,
>> while rtw88 already has the SDIO code and other 8051 based 802.11n =
chips
>> like RTL8703B and RTL8723B.
>=20
> Maybe one day people can move RTL8188EE to rtw88 as well. For now,
> rtw88 is only one driver supporting Realtek WiFi SDIO, so let's add
> RTL8189ES to rtw88.=20
>=20
>>=20
>> On my RTL8723BS series Ping-Ke said it isn't so good to maintain =
three
>> interfaces in the tree drivers, but he kept the existing ones and =
took the
>> new one. So I would expect the same split to be acceptable here.
>>=20
>> Refusing cut I seems fine too. rtl8xxxu does the same for RTL8188EU.
>>=20
>> [ ... ]
>>=20
>>> The implementation adds chip operations, register tables, firmware,
>>> and an SDIO binding.
>>=20
>> The firmware in the PR is byte for byte the same as
>> rtlwifi/rtl8188eufw.bin, which is already in the firmware repository =
and
>> which rtl8xxxu uses. So I don't think you need a new blob. You could
>> request that name, or add a Link: in WHENCE if Ping-Ke prefers an =
rtw88
>> path.
>=20
> I prefer a Link. One day rtw88 can support RTL8188EE, and remove =
RTL8188EE
> from rtlwifi. It'd be easier to move firmware from rtlwifi/ to rtw88/
>=20
>>=20
>> [ ... ]
>>=20
>>> Would this be an acceptable direction for rtw88? Are there =
architectural
>>> concerns or requirements that should be addressed before submitting
>>> the series for review?
>>=20
>> =46rom my quick skim of the PR, I think the direction is fine. What I =
would
>> worry about is how much it changes the shared code. It needs an =
additional
>> 20 callbacks in rtw_chip_ops and more than 20 checks for this chip in =
the
>> core and SDIO code. On my series Ping-Ke asked why the existing logic
>> didn't work for special cases like these, so I would expect each one =
to
>> need a reason.
>>=20
>> A few examples:
>>=20
>> rtw8188e.c casts rtwdev->priv to struct rtw_sdio, and nothing outside
>> sdio.c uses that struct today. Maybe those parts can become hci ops.
>>=20
>> rtw_sdio_tx_handler() reads host->sdio_irq_pending, which as far as I =
can
>> see only the mmc core uses today. TX keeping the IRQ worker away from =
the
>> host also doesn't sound specific to this chip, so I think that wants =
a
>> fix in the common SDIO TX path.
>>=20
>> rtw8188e_efuse_grant() and rtw8188e_false_alarm_statistics() look the =
same
>> as the rtw8723x.c helpers that RTL8723B uses. Maybe those can be =
shared
>> instead of copied.
>>=20
>> A more thorough review will follow once the series is posted.
>>=20
>> For the actual series, please base it on rtw-next instead of the =
lwfinger
>> tree. Several of the core files don't apply there, and the
>> LINUX_VERSION_CODE checks have to go. It also needs the Kconfig and
>> Makefile entries, the device ID in sdio_ids.h, and the fixes from =
your
>> later commits squashed into the patches they fix. The sign off should =
use
>> a real address instead of the GitHub noreply one.
>>=20
>> You can also take a look at how the RTL8723B series went upstream for
>> reference, from the RFC to the version that was applied:
>>=20
>> =
https://lore.kernel.org/linux-wireless/cover.1784047561.git.luka.gejak@lin=
ux.dev/
>> =
https://lore.kernel.org/linux-wireless/20261006130701.120460-1-luka.gejak@=
linux.dev/
>=20
> Agree. Luka, Thanks for sharing these experiences.



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953522;
	b=T43hpvHN9eEURbQkVrvFH/5RCV424k88G69XKea3C8mDzpeJRcF2E3Rr2yBu40Xrb5td
	 HR/P65N8/UCBsncR4xhEohdfythaqOezr6T4z1KMP1GZzosbEPtpvrKdbatEXR5EiU+Mj
	 pEQwNyM8HIz3Jmz9L7n4WcZOnJ2g3lljnirt07Z+QEVtZi2wJR/x7FJJtphLJMnEEnNFy
	 ELI1RbiV25/4cpCdXVw1NaMvD+ZtsRUZupRgZT+/TxQ8KxD2RwmhDa/3bhPm89mJCVSjN
	 O1mF63HOKKPuk/fJp8zrEB1ne1iDCV/+oHzjeuGzx3asgUPQGKEeKasEUPol/5Lvx4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
	b=T2p50+c+D/53/zaATfTK3f7/vP1dCmxZzp4JvaTLU1LNcgzTQJqmqOPyHC6tjyaKTXgg
	 PQ6tvN4r+spoZf0je7+YBVcHXyT9FCKBejnTjClloinNlxzbxsApMYdJxjcSnm3v6hDK2
	 LjfpmFi0Ry9lwzF60p7Dp4sydvxFOPPeJBcSMjPO4IqGclQyPwAACgti+nlrRa7kAZ9H4
	 BXldVg6PnVJIMN88SX9/wQvOf9GOp2YO3UR5Vkkj3IVSuDutTU72qX0t82cT+m/QC5SnJ
	 SG9vvBQ6tHKWdT8a4iGAugoykjEp2Mkgn6n/sy/eZfa5LNrKx4Jaqe53udnD+SUy29A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvRDoa3l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE418606A32C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE418606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvRDoa3l
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e977109392so1888055ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 14:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953521; cv=none;
        d=google.com; s=arc-20260327;
        b=K/yRe9vEyKEbWDApPrYLYb2dv4GPw8STkNcqs8sskhs1eeKevxvi1tqQKKXM49C/Qj
         Rny+JVtCV8RUlO9ImDTbO8aY57wWQFdmQd01XhYLg2p0d9CUqIHw+/AXv2Mfhxy1SdfJ
         SwY9alQ50yMvn2hMeGl1PToDAzx+U7lYfyXnz5ZCFZKZJYGv7xEkxEHYJxk2UywtA4Iw
         I82nsVYFOyklAsiIc+7JRsCYJxf1zcpEmtGgWo+zPekEAzSLzSS8My0bCGYakD/Q7w0Y
         dDCjtcDXj/KTGVj+QboNhpAh8Z+ymBu2H7kLoVAS5jLbjF9rB92b0wfCyIhLIQUdC62I
         b50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        fh=XP13k8YZrACVY3spHoz/+fsOkrFLxFVG2Wtmx4Jj5nQ=;
        b=Vpu9YWOLZjVGee/EltltRXAQ0TKLCJSyqC9evv9sV3qCWowKT8FKWoHiMCFa4Qa9cj
         W3XCg5qrU14OMhVJ6YBHlKg+DKmi3tY6fIT7Md5N5j6G6gSnvNAVZDgjnpeEl0a3eVu+
         wSI/sDSUINDrc87xPmE6usO3tg/VsmIoe05UB206IpGcKtDr2k72gIoPPP+iiEupPV1i
         p9sp+fpnffQtYUtrDyqElic2VX1vCs+E6l45XB/w3fcaB2S5d4HM/E0oB9YkbW1beJ15
         ToEqYU4zmKWazZELIuFRLrn3qFq0CyGvfOTj4qyFYoS2400rr+oNzwyEBF9nwEf4r9pI
         /bRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953521; x=1795558321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        b=AvRDoa3linTuYDs2EcoTayv5BoM56vrZ1mz7hlTIZTm/ynV8a1JS8jfqmAkMVWvUga
         2+25C17agOrZrMMkvWnNqG90bcdOhrjlCb8jTLkSzbUkwxtBXhySJ5f82XmGVl2jQIIJ
         Kl4s9ltk7ob7AdNrA7ARbpXlzf6562pyuI9w+i1w0u1F/KYjIHZB0yZ7dX46m7nNjyN9
         JOyqIdUCjPbMuP8Or3MrfSmWBItU+Xl7rDGr2cC0g4V03OSI/cbfS7WzJlvzq1XaJSMb
         K0Lvn3FfwNll6drAgJjESPDG6VoLy+j1+ufaue6N5Rc2MVJi0H3B2yXJVcmgZl0Yq6hX
         Zaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953521; x=1795558321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        b=BnuAawLkRBbbs8I+ppiksxT9/0tWJnEhCnk21SKf54ZtoS5H4fMEnL5TiPIkHcGenT
         LWfk6Vk/K+YzJ1VixZbA4wmex61uZubhIHRRrMDtDaLtzMzaZZ1Q46o2u1y1VgyIXtSZ
         176+rl+sk1S5XfjJ5GSg2ktJoIrc4N+AauDbSbcKQ7TykvZ/1jUY0HpnIl57alu6WPbA
         uyhXZcv3sv8eNZFvWo7DLhJWqXpIc6TA27+wOXWG5Q/l7PYAtH6oCxy1/SCu1qzCj2o9
         iYbowBH98RwJODIZGDjXWqyjxGSCSBJj2vab6LLpfP5OQ4jsdmFU8mD5yPsgKPfgzDrc
         /+kg==
X-Forwarded-Encrypted: i=1; AL+hErGvSP5YkTkZzpcKKYH0YRmNPj1QJ+KMXDP4+EXh7n5QHjaX7FjS2svfNqTZTOihMvCD6ssusyOZCRrX5hJHfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pZlDGffHD/FE2VEnQnw2/ReiqT5cvHtJWG4GUHH9nUMKbr4Uv
	ey73p6WUd27vi3gS5r4a+bIZH012f3dzPXjIezAXLEjDtO0YeiGrAN73OtztNaOSTwqLyp/7t7b
	zowhOuTntwC1lJIt217kyDuCTA77SYWU=
X-Gm-Gg: AZFdTZdybobVUOOQanSzDv/6B0x82N/ZmyQeYQh0TVF5GWCK9eyekaHuhyPvHMrz0p6
	UaJHMNcf3dlj0pqMgKGSbMvLTsS2I349n41nAS1DJps7RZb3KNTtI7hVNPYT4FQDeb28xdGbeu2
	ojnXmAClrMoiJXwABWK5NiIVbv0av75Iuihnhl4g9VcuTG6QREZJ/1UaTEV1h13TDzpRsPFE5Ty
	siacWrw383Mcjie6JY7e0WOxCE4HrQPXjsfF9FLFDWUNboquc2nYuEGcJr9nQbiOc/huauywZQR
	NhK42MTtY9TbM2lUS9BLypNMZhgu1B5G65q3T2Ae6TolKqoLu+IqWxwuSMQ0uXktrNkvWS0pTmL
	aJ1KgtN3GUe54QqtZGzwTNAXDLJhP9y7Us/j01rbUesdP6b2gWvKspvE6Lr4tu4+2dcwJmw==
X-Received: by 2002:a17:902:fd8d:b0:2ef:e20f:3edf with SMTP id
 d9443c01a7336-2eff7529705mr5827385ad.13.1794953520979; Tue, 17 Nov 2026
 14:12:00 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112050816.2795512-1-ragulbaby@gmail.com> <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
In-Reply-To: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
From: Ragul Balaji <ragulbaby@gmail.com>
Date: Tue, 17 Nov 2026 16:11:49 -0600
X-Gm-Features: AclHuK8fNwCXBJ6WwVXG2oDZIXOmCX9RXf9oRWA0fqinCW731GZtpgkb8AVaLd8
Message-ID: <CAJnRr=qQMOsqh0Y3yXwdFfHtztJAhCVbPKO+kLzCSgRjOrcytg@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a
 shared header
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:52=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> > The Broadcom USB bootloader downloads firmware the same way for other
> > USB chips than the FullMAC ones of brcmfmac.  Move its commands, states=
,
> > firmware header and response layouts from brcmfmac's usb.c to a header
> > in the shared include directory, so that other drivers can use them.
> >
> > Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +-------------=
--
> >  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++=
++++++++
> >  2 files changed, 79 insertions(+), 67 deletions(-)
>
> [...]
>
> > +#ifndef      _BRCM_USB_RDL_H_
> > +#define      _BRCM_USB_RDL_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#define BRCMF_POSTBOOT_ID            0xA123  /* ID to detect if dongle
> > +                                                has boot up */
> > +
> > +#define TRX_MAGIC            0x30524448      /* "HDR0" */
>
> [...]
>
> The move itself looks fine. Like the series "Move brcmsmac code into
> brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
> part of the reorganization that has to go in before the brcmbmac driver
> is sent again, and nothing else in the tree uses this header yet. Keeping
> the brcmfmac and the brcmsmac parts as separate patches is fine, but
> please send them as one series with a common cover letter, so the shared
> pieces are reviewed together. Since the series then touches more than
> brcmsmac, rename it to something like "Reorganize brcm80211 code into

Thanks for the review and suggestions. I'll combine the brcmfmac and
brcmsmac changes into a single patch series with a common cover
letter, and update the series title as suggested.

> shared directories in preparation for brcmbmac". Can you clarify the
> additional sign-off from Ho Jie Feng? Did he co-author the patch or did
> you use his (earlier) work?

Regarding Ho Jie Feng's sign-off, this is my first time working on
this kind of contribution, and Jie Feng has been guiding me through
the process. We've worked on this together, including the
implementation, hardware setup, and review. His contributions have
been significant throughout the process, which is why I've included
his sign-off.

>
> Regards,
> Arend

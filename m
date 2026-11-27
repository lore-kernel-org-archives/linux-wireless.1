Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795762850;
	b=PNvNTPy+PetMMf0upQevVz3Oj8CU5JEv3sffACVMnR4R+JSdoC/0bvBUvTqtRFBwf3Nw
	 OM0bCVVEPnBLL4zsKm9g+idqlows+r3M4NOh9m6u/pMFeFd5srNKHe6P2CaD0zQdN5/in
	 Doh1EEWbA7Yz/KQQfvH5R/LxNTE9VTDRV7CZ1fXvCll1weRwf2pgDrct6Bpg61qb+fNiq
	 hjfSb+iMagUKGVqIS4Yxk52/sUth5mBM0RTpWcWZS6KyjPtm9WJZKuF5TOo1IinWpLqfR
	 6m6PQNhcOYj7CSaQEzFjgJuoLuvaOtkkyyVbQfhT0oXIPxX4pkc8H6VX2lzuSXaNIDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oraQJNzWgI4tubA6Xa+fcNRXF+kojzuQRV2/Worzi1s=;
	b=E6m1VSJZgOLKYUm8zliDpfOyoDH/YQ6GEXgPwfWevLz9YjhpcwS75I4bO4Z/YnPZPww4
	 diU2km/vyrXdj7xXunMTpf6Y8o6IQCp9qNQLwBCreSYoHe+9xI+aiSB2OxSaiUH6AVJCb
	 YLkD1tmXDzRQppZvUU+jRHLp0nQWB214EHwU1W5nPLyk3AK9e/qKrWY/HZASKY1cCiao0
	 fUmtI8k4dwk4u6pSQ4BMtMqW/CFF4UJneeVKgQNF+DHkmieK8sTZ6Vr9A7SxUHuHQeFx5
	 k4/kP+TcJgfNpwOVByJrj6e3FL69I+opE6IHqyu7Doxcr0u0NysGtu2ZcI5sj+czgbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yz9RCHCz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D873606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 07:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D873606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yz9RCHCz
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5188e17487so309057866b.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 23:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795762848; cv=none;
        d=google.com; s=arc-20260327;
        b=hDmDYHpCffcUrUo3FkCJChtCb+HT4G/te8E7q76WDnmpkLLriIFlJjt/f/CfrAxCTq
         MA3nKBu8C34ivMV2eBLhYnM0ssyQCsRhpg53h4RIXfQPycm4RihgCABI9G5dqekBf44x
         ltJ+ad9rNk8c0ICUq/3vlFZrnGYEiJUpVyUazIvXAdNA/9W3vRKJ7spP9qn2uKCXpgMj
         BPau9RisRp0IV7+9ubv3IwyHpiOhBDQz++32RyZFKubEbz2YFrpVH2smP3MtRTD4lOLP
         +NqkY7FMUb6sVr10aZR8CyxXONf8GdTxMoKfVBak17jFR11QHQ1Kp7Z5BAY+XPdEBhlb
         2Yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oraQJNzWgI4tubA6Xa+fcNRXF+kojzuQRV2/Worzi1s=;
        fh=GAFbY5ULYhSA1ymvqju2jSQfBJ6BS9dO1RMn/Xye4Cc=;
        b=jKSomz1jg98KgKpiJfZI8WYnt6Wb3V8AkCCd3kMD8tImAUb4ZfS/J7W7H3XX/cryli
         XxCpq8VvImgxhZ8MZbLT+xrEE7rGylrUIzf8qrRznWC64UZs9pbMawX8S58jxYYe8XOa
         fghG3JG4KRZ/aN1L0knnoVheRhQ2KK7wmLSSq2nee4SGd3PxN6RHsto6aG2cHko5pFPe
         y0/MfrmMAmEEKlEflCD/agpPYLbnAxXo1bZ7itqHb6PgkAV7lGQMN3XJXWn7BPBtMPAp
         OUKlZvaU7nQdgUGPfWgL8bvRKo2FODJw3/hex2EDUvHt0Qg+/flXCCtXvOMiMyKkK4Lo
         Id2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762848; x=1796367648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oraQJNzWgI4tubA6Xa+fcNRXF+kojzuQRV2/Worzi1s=;
        b=yz9RCHCzhBBepzVDmIWIX51QLCPmzvP25+S5O8BUOJZR6WQF3+MX7T/WzeLGq2lOxI
         nxhDcq/Y/vg9nVeIjkalWY5Aanq4326SmAsAEMe5KCdOAmt9YZNiHP9evYp6SmC2GXgh
         Aa61+p0MxvjVBFN2HXYFVyD8W8sEhwGktx4mOTWAKSF4ipjtC1xOGyrT4KcRxyb+qy0K
         A3Gn8PI/H6ghfdQvT2CqYiKZeJhuOutYugRDw7CbxJ/0tBipCk+Phly/7luBitnZuxS5
         0z2mLn277kBBe5nNHZrqpay3z+10eZmM58AVlGanA0E1Vg5DLzoVkgYbbDC+mIp/guMB
         13qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762848; x=1796367648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oraQJNzWgI4tubA6Xa+fcNRXF+kojzuQRV2/Worzi1s=;
        b=NkPCRAj/7K2KDE65aApkZdiS6vwbVJugrJwnnokJD339fsNpac//52buQ+Dp4jiAwt
         d6fTszQ0Cx1WzNlJ29JjbzuAkAvaN0Xu8rvvOcmKG6lYe8mCql1hFtyHBAQ5P+cBoqbZ
         viQANcyXlBKpAgjc9Z6+KAwBBxazO+u07UeGyjSKvCDefodMdKvMGjNPuuXUHFwygca1
         0uXdUiMcnizsTjhbnKwUB6MLKga5VM6cP8Il/skIi7XdKtpbJ3B8/8wWEY1vDwc0W9wf
         J7qznqMzWrunW6UTQpPV88GYb6ID2oXWG8FPT/qdBnUTjXCBFTeEifvGZ/Ck3fNVG9X/
         Iv+w==
X-Forwarded-Encrypted: i=1; AL+hErHFJoa7wTIHzrOAkuuSydNs08zZtDamMniuD4o4ivAjzRph8XC/fIcsLlTy4iOug8SXVVGAigmdvcAKcVj80g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/CMHtRD2ecvRG0UZVqs/eYqG2DYdqpU7ZwLDzBcu+GSGb+VWy
	LnVLIWEuRbqyaPK0SFBGIdgRylIUSYze7HQx3jRNfjqy1M4uYPwx+uc/Nrfi9EsR8xpURDnpGp/
	DFC1X0z06ZT9dMz8w+4FoNceOwaociHc=
X-Gm-Gg: AZFdTZd+OyePRjavwiyDwARMjE/EX+Ne0KEW/7hRtpNkT4o0yrQceu7otdw4urEUGzb
	YpNxHclHjtEbhMBoXvmhph24EriEH0DcEabuqfZNKV2/vLfV3Fdw9D0qeIsfwZlSV3oqMApHaxr
	q9AGYNb2oCx3tThwK51ShYUl/uk+7ZcxAs/FsYihYv2ni7uYAMc+wIX6s+21p4M8HnSH9tSTmsI
	tVgSax4XJnkTHd7IxADPy+pQg4yL04yZ+GbZO4B5bHXxn33XiBzjvSfCAJ96uJT96M57tYWNcXK
	rKfqInDPtv+3J78y/HTfOPVw5tXLvAaG4Kk5Hx2evctbT65/cb1w/GZg7KCE6IGUVuMQjwZibqe
	Ou1BHvBuKhLNJGDCvsAr2Rtb4Asai7TxmPo8=
X-Received: by 2002:a17:906:7f01:b0:c4d:2867:281c with SMTP id
 a640c23a62f3a-c513a89466dmr1500652166b.1.1795762847845; Thu, 26 Nov 2026
 23:00:47 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127004822.8536-1-shindeswapnil028@gmail.com> <24cb6dca77d3456fb5893ce37b0bd1c7@realtek.com>
In-Reply-To: <24cb6dca77d3456fb5893ce37b0bd1c7@realtek.com>
From: =?UTF-8?B?6qeBU3dhcG5pbCBTaGluZGXqp4I=?= <shindeswapnil028@gmail.com>
Date: Fri, 27 Nov 2026 12:30:36 +0530
X-Gm-Features: Aa3M54qDH_oqhKSEDIr74WA-S3iGI2rDRBO0VmVETvFjJ-QPpQ-Dxcn8IAPi_HQ
Message-ID: <CAJEWX79Jini8C44xiP_O41--eWEhcpZnMiK84Wp8dqmtO-D5Qw@mail.gmail.com>
Subject: Re: [PATCH] wifi: rtw88: pci: Power off MAC and disable interrupts on shutdown
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "kvalo@kernel.org" <kvalo@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ping-Ke,

Thank you for the review and suggestion.

I tested calling rtw_enter_ips(rtwdev) under rtwdev->mutex in
rtw_pci_shutdown() (with EXPORT_SYMBOL(rtw_enter_ips) added in ps.c,
running alongside the companion btusb shutdown/autosuspend fix) on my
RTL8723DE laptop:

- Cold boot: Wi-Fi and Bluetooth both work.
- Warm reboot #1 (Wi-Fi ON, Bluetooth ON): Both Wi-Fi and Bluetooth work.
- Warm reboot #2 (Bluetooth toggled OFF mid-session, Wi-Fi ON): Both
  Wi-Fi and Bluetooth work cleanly (no -16 MAC power-on timeout or -71
  USB enumeration error).

Using rtw_enter_ips() is indeed much cleaner than manually clearing the
internal flags and calling rtw_power_off(), and it also notifies BT
coex via COEX_IPS_ENTER before entering PCI_D3hot.

Regarding commits 05202746ed70 and 44492e70adc8:
- 05202746ed70 sets BIT_USB_SUS_DIS in REG_HCI_OPT_CTRL, which does not
  power off the Wi-Fi MAC before 44492e70adc8 transitions the device to
  PCI_D3hot=E2=80=94leaving REG_APS_FSMCO active across warm reset (-EBUSY)=
.
- Calling rtw_enter_ips() right before pci_set_power_state(pdev, PCI_D3hot)
  cleanly resolves that while keeping both commits intact.

Would you like me to send a [PATCH v2] that exports rtw_enter_ips() in
ps.c and calls it from rtw_pci_shutdown() in pci.c?

Best regards,
Swapnil


On Fri, 27 Nov 2026 at 09:17, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
>
> Swapnil Shinde <shindeswapnil028@gmail.com> wrote:
> > Currently rtw_pci_shutdown() invokes chip->ops->shutdown() and
> > immediately transitions the device to PCI_D3hot without powering off
> > the MAC or disabling PCI interrupts when RTW_FLAG_POWERON is active.
> >
> > On RTL8723DE combo cards, leaving the MAC powered across a warm reset
> > causes REG_APS_FSMCO polling (offset 0x5, mask 0x1) to time out with
> > -EBUSY (-16) on the next boot. Power off the MAC under rtwdev->mutex
> > and disable PCI interrupts before entering PCI_D3hot.
>
> IIRC the commit 05202746ed70 ("rtw88: 8723d: Add shutdown callback to dis=
able BT USB suspend")
> is to fix the problem your encountered.
>
> The later another commit 44492e70adc8 ("rtw88: pci: Power cycle device du=
ring shutdown")
> is to let PCI enters PCI_D3hot.
>
> Can you revert both or either one to see if anything different?
>
> >
> > Signed-off-by: Swapnil Shinde <shindeswapnil028@gmail.com>
> > ---
> >  drivers/net/wireless/realtek/rtw88/pci.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wir=
eless/realtek/rtw88/pci.c
> > index 66d2e5f51..b0bbb9397 100644
> > --- a/drivers/net/wireless/realtek/rtw88/pci.c
> > +++ b/drivers/net/wireless/realtek/rtw88/pci.c
> > @@ -1949,14 +1949,29 @@ void rtw_pci_shutdown(struct pci_dev *pdev)
> >  {
> >         struct ieee80211_hw *hw =3D pci_get_drvdata(pdev);
> >         struct rtw_dev *rtwdev;
> > +       struct rtw_pci *rtwpci;
> >         const struct rtw_chip_info *chip;
> >
> >         if (!hw)
> >                 return;
> >
> >         rtwdev =3D hw->priv;
> > +       rtwpci =3D (struct rtw_pci *)rtwdev->priv;
> >         chip =3D rtwdev->chip;
> >
>
> Can it just call rtw_enter_ips()?
>
> > +       mutex_lock(&rtwdev->mutex);
> > +       if (test_bit(RTW_FLAG_POWERON, rtwdev->flags)) {
> > +               clear_bit(RTW_FLAG_RUNNING, rtwdev->flags);
> > +               clear_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
> > +               rtw_power_off(rtwdev);
> > +               clear_bit(RTW_FLAG_POWERON, rtwdev->flags);
> > +       } else {
> > +               rtw_hci_link_ps(rtwdev, false);
> > +       }
> > +       mutex_unlock(&rtwdev->mutex);
> > +
> > +       rtw_pci_disable_interrupt(rtwdev, rtwpci);
> > +
> >         if (chip->ops->shutdown)
> >                 chip->ops->shutdown(rtwdev);
> >
> > --
> > 2.56.0
>

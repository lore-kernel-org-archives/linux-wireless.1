Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794189256;
	b=ZcJzXUqC0DNQ7Wjl9mikLjlz375PMRdl8JBIpR/Wcov7fv+y2+w/D1EW1/AyZrESTrM5
	 57iKAeLteo3PBd3z2oW+IKmqGfvOMC7R6yDP1Aojdk06oByGIwl6uuXdAt6PwEqCDJlrJ
	 05TOjSuSqWb2vEQgwXiS0NS6f/BaM/gF2dBfjT4VH8vXgayMB09nAZel5l4xBjasX0BEE
	 fJdQcfurcOWM7GvRvvY/X3ns+heNRwgArfz8QWJlGQLvkEw2upz+jHCmn425dBPUi0ZZ1
	 ei0066VDLZw9lVL+H//q/Wg1XDum/c1KuO9yYlIYEq2bXsbckL2Yj5Plf3Et1S+YYhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
	b=IM5gAYbBlBy70dGfAvRfKPJqllBHEFhRov+MeypYAqF705dSRn3bOiW7vmP+BheeOKGx
	 u8khQEdV+oaEH87MC3drOAjSWnx23o6Ji7TA24XakZI4W8ZfdYLtYOOlyQwew+zYGozJi
	 L3BIx6zG7IgpMQTKX3ULosRVXpLKK/O5pf6IV8BjFBKpLGnCC523HpauR1Pa8NTJOEPcz
	 jsyUvLT808EErO8nSBeB8GcBatZBl39w/Z6q1EMht6U6gSV17j4Wx8y6mwNhTKAXGq1UY
	 OsG1pMFQb06uMkZTwaInkdRa3CPoSlG5UjwH+IfjXaYBAVWWnyIzVnoa6WyHigkfwdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IsQ/XDT9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F0606A321
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 01:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsQ/XDT9
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-843cf077f10so600478a34.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 17:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189254; cv=none;
        d=google.com; s=arc-20260327;
        b=m65FvpnF7aSVWPF85yo2yXwykDHVMEqk/6dMXVLmCtxzUyp7lUO0yOk3c2vCwsoqJQ
         KyN/HJI9E39qzg6sr45ltvnYPEXvzeiNde36aVO78RkhMaLkvijwc1YZYahzN68G373q
         asxS/zzhP71weoLUgmQlu++7CY2P9MbqiXrBMf6v6yXLNtqL2Pw0bPd/eZkf6JyEoZCD
         xXsB368dWt+d0kSthuuo++rzOoII2upLan9QVZ01zoiXE7Zj7oRFa7VuIp9nTQKIX+CP
         DMRi6bxwZYCX8tLbdd0nxx2Npe+3R1IDNTjwBD1Unr1nXSlZ2jqvPVzwvaAuLEsI+Db1
         eANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
        fh=9SKooS7Xh0GP2ZXb44mApRJQgiMw5tYrdvl4iuXS9XY=;
        b=ljvgzor38lompkZ5JLkl4dL5+p+f1MiZddCWmHWWKenUpO4CLBODSyg0Gu/CGrOnR6
         VD2pqxnSi7gTxdcidFVnERJflf+RGq1+GDlOGPISq9v0dD8rmuC9B7KuN+5oaogOfDRY
         XEn6EHBuPHcjI29LluuHH9pp1vqN9wyde8SDyhDVj5Rnb3G8G6gjgyoW/pbisVbGJ8w2
         TRjZyMhhN4JZb073NTKy1WL5SqXWlKbFtKHJRLn9GYwTybWwbA5dtGhPy7rwfFkjJ6kB
         PqC/xkzT0w7i5p3TBHiz7GrEG55MZc9WBNH21exzay7fQDjO5dYbHjyiZ9dCD7EwRKcN
         Fn0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189254; x=1794794054; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
        b=IsQ/XDT9i/AwgbBrEU5Ic0at//FpqdtsuFmjeJ3b51SEhgN7283yobP6GYKLRL2Nh8
         bkZ/zTIz2R2XyajRzUKvWwS+fr0wrrmZsGuAFIwxiz3JyPnHwXQrDM45ynQHE37mIKYZ
         WKXgH0ZGkYWNf94DhpBt+CTl/uRKTbxRD09FtyWNwUg0UyZWPbsIzPKuLDndCBY36nd1
         9DiLfUmSaDO8trl49w3iCHwKXVqGFwNHHPxHSaTdkGMS86y6mfpBzwt1gA/vFKSMb2WI
         Qw7gpNA/95m26aYzlhmr8GlFpAJKTVkoWFCZtRnB2geKXGB/4HLoDbWtxd4/PymBU6Bl
         8ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189254; x=1794794054;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
        b=Kb1T8ub+PHcv82Xhyesuglix7mIJKIuS+oo/GhBu3dFxuYc2fqLBirwiLerTpZvWQz
         Yqu5+pJV8keJ7shK/vgNZEwtwu1n9+E4O9S76Rudi2OQOcSgDeRSRtPShL2TAnwBC/04
         Cpr736o8CJNIKS9YdD5IUwKJp6Vj8RJJ9dbmlaPp0VNEb/bTpVihG6jefOtURPMxZM0f
         n+cjSF+918iH0NGLIt8G506G7Vf0eofjmBnazoDBunI6I3WDeROX7XgdT/94HZ2Uo5qL
         cms8rhyN7Ozx6OrhGLKwW+RWjlZXBdNURENnDLxTvG/MIJc3UXZljltchJePfBoyRvA7
         QR/Q==
X-Gm-Message-State: APuU4Z/NcnCfcQUBFhJCxtAAl3lHcMqu90hb/NaTnZMX9WcL9hV3Lspt
	OWFXqNlafHImPxXXQJtO0n+ddJ8EihSaES+H4YyNTixRztMdyb3ptDqhi0h51bH0KnVioZW7fCc
	7eOo/kiT5KmDf0DQGQrvzmUdHPDVUGzc=
X-Gm-Gg: AYBFou1xm1zZ69NOvQ0Ret/adjNpIH48L7bnfq5+hUKPFVcmVPF9kcfLY6jd5HPy8pb
	8TEN4vwo0PvjTHrtCq5q2G1dcQQOxYronMgizY/hHFZuu+U0o3bS7gdyKHLPYgXwapcXsXiANzW
	4k66Bl2m/mhrttXd/KFCtSDjduFYYMdF+KGD1leX9YupND8fAxhqDAaeQrcjxQ048AlErgICxjQ
	YymODjuk2N3IVh/A0387vGBWQ/zJR9SsrWzELidPjliOU6kgPv0n0aLakWmP8WswY12SOYXO5bB
	VxgvXn0eyyR4nJeJdCBj5FvBcUj/Ssw+QRoFm2xW9VHiHXMRTu6ch4Rt52cBshX/3IDqGhxDBfA
	OBWmOL+icQLXA6oNmCErWb4CQ8fb9TjSpHQ9azJVM/e2A4F7MrPVKE5+L3BfUifBg8agQ
X-Received: by 2002:a05:6820:83c7:10b0:6b6:c0bc:365c with SMTP id
 006d021491bc7-7170f2b844cmr994551eaf.22.1794189254232; Sun, 08 Nov 2026
 17:54:14 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-5-hjf3108@gmail.com>
 <e826d25ce74e4d839f2719509494c129@realtek.com>
In-Reply-To: <e826d25ce74e4d839f2719509494c129@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 08:53:37 +0700
X-Gm-Features: AclHuK9Kg-B18Wze4SmrNfYZu_MVp6DLqT-Zh7gXPblkHjY1rijIvegMp2DIiys
Message-ID: <CABOQOSXX=3ZPfGmXBLfHPcGK11dqMRZ8vAC05OtstQtWS7Un6A@mail.gmail.com>
Subject: Re: [PATCH rtw-next 4/5] wifi: rtlwifi: rtl8192du: enable USB RX aggregation
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 08:44, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > Allow RX aggregation of up to 48 pages of 128 bytes or 24 with two MACs.
>
> You can describe a little bit how you build separate skb, especially
> the last one.
>
> >
> > Test results (2.4 GHz):
> >    before after
> > TX 5.2    6.4
> > RX 27.1   32.0
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>
> Acked-by is given, but some minor comments.
>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
>
> > +void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
> > +                             struct sk_buff_head *queue)
> > +{
> > +       struct rtl_priv *rtlpriv = rtl_priv(hw);
> > +       unsigned int offset = 0, pkt_size;
> > +       struct sk_buff *new_skb;
> > +       __le32 *rxdesc;
> > +
> > +       while (skb->len - offset >= RTL_RX_DESC_SIZE) {
> > +               rxdesc = (__le32 *)(skb->data + offset);
> > +               pkt_size = RTL_RX_DESC_SIZE +
> > +                          get_rx_desc_drv_info_size(rxdesc) *
> > +                          RX_DRV_INFO_SIZE_UNIT +
> > +                          get_rx_desc_shift(rxdesc) +
> > +                          get_rx_desc_pkt_len(rxdesc);
> > +
> > +               if (get_rx_desc_pkt_len(rxdesc) == 0 ||
> > +                   pkt_size > skb->len - offset) {
> > +                       rtl_dbg(rtlpriv, COMP_RECV, DBG_WARNING,
> > +                               "bad frame at %u of %u, size %u\n",
> > +                               offset, skb->len, pkt_size);
> > +                       break;
> > +               }
> > +
> > +               /* The last frame keeps the original skb. */
> > +               if (ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN) >= skb->len - offset) {
> > +                       skb_pull(skb, offset);
> > +                       skb_trim(skb, pkt_size);
> > +                       __skb_queue_tail(queue, skb);
> > +                       return;
> > +               }
> > +
> > +               new_skb = dev_alloc_skb(pkt_size + RTL92DU_RX_HEADROOM);
>
> What is the purpose of RTL92DU_RX_HEADROOM ?
This is for the radiotap header, like in usb.c.

I could drop it, or add comments or a commit description to describe it?

https://github.com/pkshih/rtw/blob/rtw-next/drivers/net/wireless/realtek/rtlwifi/usb.c#L582
> > +               if (!new_skb)
> > +                       break;
> > +               skb_reserve(new_skb, RTL92DU_RX_HEADROOM);
> > +               skb_put_data(new_skb, rxdesc, pkt_size);
> > +               __skb_queue_tail(queue, new_skb);
> > +
> > +               offset += ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN);
> > +       }
> > +
> > +       dev_kfree_skb_any(skb);
> > +}
> > +
>
>

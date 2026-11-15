Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794780675;
	b=RlsM91pu6CtGpSBdz36VggaLU9RsaJ/olSiqQLv1y0iXlXx3nPBeaKkPkxV1mGM/x8jO
	 OvmgOwvdCeK2BmSIULySbCPg5uQK9EYOfNuxgEZGT+vDXK6d4C6mvIwI2B/kqJC2qZaCh
	 HBzXFuLV2YZxAiMd/N3MhvFIXeVRO7IAEs/KDc9dfJ/GbKK+XhQ773LflzvPJFyKmtLbH
	 +B2TOphVRgFcCKsu+9nSw+0Pt4fhVc+9L0+x90mMZSaG8Hsmw4Kbnq4Uxfucb2zxgIGo3
	 Sg5y4hAkiLJP1d9PzgFHqjUA6ize+uAFqQhTzbSCREiGfpvEUE3pJCEpmiJMgfgNJEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=;
	b=3xaofX+4XN/I21IfyE0IjKNeQGOARAv0zcjRDSQYd3ZaNiDvGsgx+MxPP0BZMagnU8Dq
	 tExtSIDVRSGwz6JXzequPHsJ1HddlmbV8tjKVctIhUVp0ecqWeMVVuESfk+0FVTEdoSwk
	 X1xERKxslTFXm4+bSva2GPJejcV29lWqZtb+I3VTwvZktRANVLtRp/XfmkXgKlT7KHGs1
	 cxNjWSIDN0xUSEgK2wgO/QIyVRp/YWCPlfv6rARRGuNablIZydwggwoSjFUVdsKxpUcke
	 U9lXG9MAEFTIzpo+S2FT3RrYyVxZAjjZeqc96VjEavTyjVe2KyMdWrAt6sVQhCX3B1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7V9Z8kO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC7606A31F
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 22:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3FC7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7V9Z8kO
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so3084251a12.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 14:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780673; cv=none;
        d=google.com; s=arc-20260327;
        b=j72n/YGRQ+j7PCSSQWtjCk2BYR5EcuSZySc60QgkJJuCFApxosP3iJzGmJlZqnDQGL
         rztvUV3uuyFVRk4qnAnN8VBJQ3QVNswfWtKYTF1/mT1XoaEHRytbQZSPVjpfzbYrpl1/
         eAqIRSOStQKolv9DTAAth2ID0P7aWicSxKB2/YENhvJbG+jKzBRMnRDnUd6q98EIcdw0
         m+Trg0HBvWFA/5fBPdzghrIpTxrPr/1OowIylUL0p+n7a5HH18b0tmajFr+MAw0qIhRp
         gIGD9D8zyGP2eHmc99QbAMA2HQGHiiNY0UIrX56gl+enReKZ73jBArQHUrqcc9mGRupY
         iCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=;
        fh=EkNaubhWKPx9sbyyHC12Raw7lmcX5wZZB1y2bMB3rwE=;
        b=KgW6pN5d7Lewo7py48h3tJ1FPMB82ctF7eY3M5BipUgTtcRN0XtVBYExGG81IpJJPF
         1nunZ+ES9xGk2Xpg3LZ4tXK4TFEcL2qNirWRBW/cxVWc9kpDWNcGeKGW7JMDH0cHauJb
         ZhnfNifF7Nf5ifV2b+v1knEVhfh/s7kUlnqWPNtCmHlgPTVokvI3m/HzrjhGMkN86KRU
         hmPNthvL7cTELnuXBnpPnAVL19cSduNMT10/ESE1/R+rd4mUFnNOVWvckL0H2gCw2OKb
         qDNTK/lgOqj4+6JX/N8BYqT2nDrYREtb73Ihl0NS0uV7P/qMuPw60FCVtGUf2M1XuCwC
         bJMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794780673; x=1795385473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=;
        b=b7V9Z8kOYVVDjH6k4lvwTgLJtJrs+RAT+ugjkb4Bll+2TmiHX6pJRmtifSpw1ZV55u
         2w7cX6Ec5HbhtHE30dF4W4mdOoa2GwqMnSYWiz9Z+7szUsjxFy1fjpBnxPYC6wsJDMlS
         WH172WFsaavcUuUfpCwIP+NzJXdZKYMIzIp2SLPjaPuYHd/HzdIQhO5k/iXhbHLMrxnw
         RttQ2+F7l6dNd4oNWv6WYwEtbepVazow4JabiWRTlSyLYLGGG0w0kY/eW/HdD/km7BEn
         UMslfKdGOteDjJjmwnfdR8U28w6dtjyn3gkXqwfCrNB7jFxKj23A9K3k8hsgw9E07lxT
         cNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780673; x=1795385473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=;
        b=PIAulU9wLJ6bkUAlNxKo92yXFNeOSsYZJPituQS3trdRJLDxtrJPq/EmtgVhKVNjRi
         oldMJ0DbXbKRVaBQWs8w3Oy+1xYBX1vHQu/+HyVnQd0q3jfvAshqXasa3IsQy+9e23ks
         Uqf9V1ObH5NPRILel511Q/kIlMy1Ue/sK1MLk5k3EK23sznvKKSKIeZiIHzFhT1gVHnK
         2p62ih/A1pLKRCWQr+MZmGXQvCc1WxGWExDmgidhenmInPbNXhzgooNmn/XSJ5039efB
         SCUwqZTk0n7qeaWquOn2Ogfw8QWIr47DMcgEylTmXw/xUNNzWPP/rketaz5mUz225Ou0
         19oQ==
X-Forwarded-Encrypted: i=1; AL+hErGvx/UFj93xjQx5aMqQL7P5VUBSpEqyVwdd1eqtjOsOnWB+07dSEJVDOqTASlRSzHp0RttJ1OHMAoVDwmFo1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ArIQxAofKcA8Iw4ArelzQVlOmC+XB2d2+qALTDRNjvRRYzEKO
	28VJZBODfxBrwrZ5v5rlp/wFF3UsJ5EjABjOZ+RqrTy8UqlVP4cEOxXvdoepi90LLY3MBPP1TKY
	+PTPmWbyV7gq1+w3nEuVPbaHDpBmbsZs=
X-Gm-Gg: AYBFou2O2WkM8pPd0bDI5q8SiN1IPxSNvTsjnDDHF+eBB8905EqEAqnENMUvjtL5WX4
	LNvHOpNPcNauW0zSVTlBO1dMkNWTjOKHhCH9Vee8WwlSA74OjwjmmKkHoPcR6w+NFVgGmNnlc0S
	8z7f790VZzhSpnoZtSEmovVObprBFZBc6RvZypdTVCuK5JC+BCktSZPYedEeCz4O5Yng6kagX2I
	vr43w9OPx/oJECUhQtOAMcfYEGkqM7r3nERXq51JTxgEKHS317wjU/4TIYKOaJgfa+94kQO2EQ3
	ZXPbA/c11NQEZ61TRH3PZt/4A1+9oiF4b0vxQkbyjw5MQjOkx4hxRbsVcPfQeK/Bopa+vh66z4p
	4hsUTLnXdKAQaoCgja03CXT5TgSvQ9abt1q+L+giJjw18tJZF/n7IRYPjW+c=
X-Received: by 2002:a05:6402:210d:b0:6b4:86e1:cc67 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fd49mr6049392a12.27.1794780672927; Sun, 15 Nov 2026
 14:11:12 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115025635.40010-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261115025635.40010-1-lucid_duck@justthetip.ca>
From: Chris <hoopyfrood42@gmail.com>
Date: Sun, 15 Nov 2026 17:10:58 -0500
X-Gm-Features: AclHuK-J-XS3bS6_P8NNBw8-09rcQZeT-WEOdlJvOAZ3ak_yNR1JNy2eYlAI-4M
Message-ID: <CAHaeJsRTd5KjN9CsKDU-g8Ut-WfBuiKkTnkBSZ9hQSsr7P_HQA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Michael Shih <michael.shih@mediatek.com>, 
	Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 9:56=E2=80=AFPM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
>
> Busy time in the mt7925 survey is bogus. Its register doesn't work on
> this chip, so busy outgrows the time on the channel, and transmit time
> comes out far too low.
>
> Ask the firmware, as mt7996 does. Busy wraps at 32 bits, so subtract
> in 32 bits. The MT7927 counts 5 and 6 GHz on a second band, so read
> both and add the one in use.
>
> Over USB 2.0 a full-speed download can hold the answer past the
> timeout. The chip is fine then, so wait a few seconds instead of
> resetting it. The next read catches up.
>
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Fixes: 05fd14885303 ("wifi: mt76: mt7925: sync MT7927 BSS band assignment=
")
> Reported-by: Chris Kelly <hoopyfrood42@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/CAHaeJsT8O8Nhq351hFp3NAL8e=
0iU85N-LBdYZ9nYHFHVy7t_hQ@mail.gmail.com/
> Cc: <stable+noautosel@kernel.org> # needs a backport, older trees have no=
 MT7927 support
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> v2:
> - subtract in 32 bits, Chris saw busy wrap
> - no chip reset when this answer is late [1]
>
> A9000 on USB 2.0, full-speed downloads:
>
>   driver                 length   late answers   chip resets   busy repor=
ted
>   stock                  60 s     -              0             2346 s
>   RFC with 32-bit fix    60 s     3              3             33 s
>   v2                     60 s     0              0             56 s
>   v2                     10 min   22             0             558 s
>
> Other commands answered late still reset the chip, as today; it
> happened once, when the AP changed bandwidth mid-download.
>
> Clean on USB 3.0, as an AP, across suspend, and over PCIe.
>
> With runtime PM, the default on MT7925 PCIe, the periodic work doesn't
> run (same on mt7921e): the survey updates when read, and busy tops out
> at 16.8 s between reads.
>
> Michael, this sets the same survey hook as patch 2 of your v5.
>
> Chris, your readings near 2^64 match the RFC's math at a wrap. v2
> can't go backwards.
>
> [1] https://lore.kernel.org/linux-wireless/20261113150048.5271-1-lucid_du=
ck@justthetip.ca/
> RFC: https://lore.kernel.org/linux-wireless/20261023180554.7266-1-lucid_d=
uck@justthetip.ca/
>
>  .../net/wireless/mediatek/mt76/mt7925/mac.c   | 53 +++++++++++++
>  .../net/wireless/mediatek/mt76/mt7925/main.c  |  1 +
>  .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 78 ++++++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 17 ++++
>  .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 +
>  .../net/wireless/mediatek/mt76/mt7925/pci.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7925/usb.c   |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
>  8 files changed, 155 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mac.c
> index 7af996abe294..9749bcf668e5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> @@ -1470,6 +1470,59 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, en=
um mt76_rxq_id q,
>  }
>  EXPORT_SYMBOL_GPL(mt7925_queue_rx_skb);
>
> +int mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset)
> +{
> +       struct ieee80211_channel *chan =3D phy->mt76->chandef.chan;
> +       struct mt76_channel_state *state =3D phy->mt76->chan_state;
> +       struct mt792x_dev *dev =3D phy->dev;
> +       int i, ret =3D 0, n_bands =3D 1, band =3D 0;
> +
> +       /* The MT7927 counts 2.4 GHz on band 0 and 5/6 GHz on band 1, and
> +        * the band not in use keeps counting, so read both every time an=
d
> +        * only add the band the channel is on.
> +        */
> +       if (is_mt7927(&dev->mt76)) {
> +               n_bands =3D ARRAY_SIZE(phy->state_ts);
> +               if (chan)
> +                       band =3D mt7927_band_idx(chan->band);
> +       }
> +
> +       for (i =3D 0; i < n_bands; i++) {
> +               bool add =3D !reset && i =3D=3D band;
> +               u32 bss_rx;
> +
> +               bss_rx =3D mt76_get_field(dev, MT_MIB_SDR37(i),
> +                                       MT_MIB_SDR37_RXTIME_MASK);
> +               if (add)
> +                       state->cc_bss_rx +=3D bss_rx;
> +
> +               ret =3D mt7925_mcu_get_chan_mib_info(phy, i, add);
> +               if (ret =3D=3D -ETIMEDOUT)
> +                       break;
> +       }
> +
> +       return ret;
> +}
> +
> +void mt7925_update_channel(struct mt76_phy *mphy)
> +{
> +       struct mt792x_dev *dev =3D container_of(mphy->dev, struct mt792x_=
dev, mt76);
> +       struct mt792x_phy *phy =3D mphy->priv;
> +
> +       /* give a busy link a few seconds after a late reply */
> +       if (phy->survey_hold && time_before(jiffies, phy->survey_hold))
> +               return;
> +       phy->survey_hold =3D 0;
> +
> +       if (mt76_connac_pm_wake(mphy, &dev->pm))
> +               return;
> +
> +       if (mt7925_mac_update_chan_time(phy, false) =3D=3D -ETIMEDOUT)
> +               phy->survey_hold =3D jiffies + 5 * HZ;
> +       mt76_connac_power_save_sched(mphy, &dev->pm);
> +}
> +EXPORT_SYMBOL_GPL(mt7925_update_channel);
> +
>  static void
>  mt7925_vif_connect_iter(void *priv, u8 *mac,
>                         struct ieee80211_vif *vif)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index 15d95ad32636..16dc974a1122 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -351,6 +351,7 @@ int __mt7925_start(struct mt792x_phy *phy)
>                 return err;
>
>         mt792x_mac_reset_counters(phy);
> +       mt7925_mac_update_chan_time(phy, true);
>         set_bit(MT76_STATE_RUNNING, &mphy->state);
>
>         ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index 26cdb3f0a98a..1bfa4ec404b7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -28,7 +28,12 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, i=
nt cmd,
>
>         if (!skb) {
>                 dev_err(mdev->dev, "Message %08x (seq %d) timeout\n", cmd=
, seq);
> -               mt792x_reset(mdev);
> +               /* The counters come back behind received data, so a full
> +                * USB 2.0 download can hold the answer past the timeout.
> +                * Nothing is wrong with the firmware then, don't reset i=
t.
> +                */
> +               if (cmd !=3D MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO))
> +                       mt792x_reset(mdev);
>
>                 return -ETIMEDOUT;
>         }
> @@ -1019,6 +1024,77 @@ int mt7925_mcu_get_temperature(struct mt792x_phy *=
phy)
>         return temperature;
>  }
>
> +int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool a=
dd)
> +{
> +       enum {
> +               IDX_BUSY_TIME,
> +               IDX_TX_TIME,
> +               IDX_RX_TIME,
> +               IDX_NUM
> +       };
> +       struct {
> +               struct {
> +                       u8 band;
> +                       u8 __rsv[3];
> +               } hdr;
> +               struct {
> +                       __le16 tag;
> +                       __le16 len;
> +                       __le32 offs;
> +               } data[IDX_NUM];
> +       } __packed req =3D {
> +               .hdr.band =3D band,
> +       };
> +       static const u32 offs[] =3D {
> +               [IDX_BUSY_TIME] =3D UNI_MIB_BUSY_TIME,
> +               [IDX_TX_TIME] =3D UNI_MIB_TX_TIME,
> +               [IDX_RX_TIME] =3D UNI_MIB_RX_TIME,
> +       };
> +       struct mt76_channel_state *state =3D phy->mt76->chan_state;
> +       struct mt76_channel_state *state_ts =3D &phy->state_ts[band];
> +       struct mt792x_dev *dev =3D phy->dev;
> +       struct mt7925_mcu_mib *res;
> +       struct sk_buff *skb;
> +       int i, ret;
> +
> +       for (i =3D 0; i < IDX_NUM; i++) {
> +               req.data[i].tag =3D cpu_to_le16(UNI_CMD_MIB_DATA);
> +               req.data[i].len =3D cpu_to_le16(sizeof(req.data[i]));
> +               req.data[i].offs =3D cpu_to_le32(offs[i]);
> +       }
> +
> +       ret =3D mt76_mcu_send_and_get_msg(&dev->mt76,
> +                                       MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO=
),
> +                                       &req, sizeof(req), true, &skb);
> +       if (ret)
> +               return ret;
> +       if (skb->len < sizeof(req.hdr) + IDX_NUM * sizeof(*res)) {
> +               dev_kfree_skb(skb);
> +               return -EINVAL;
> +       }
> +
> +       skb_pull(skb, sizeof(req.hdr));
> +       res =3D (struct mt7925_mcu_mib *)skb->data;
> +
> +       if (!add)
> +               goto out;
> +
> +#define __res_u64(s) le64_to_cpu(res[s].data)
> +       /* busy wraps at 32 bits */
> +       state->cc_busy +=3D (u32)(__res_u64(IDX_BUSY_TIME) - state_ts->cc=
_busy);
> +       state->cc_tx +=3D (u32)(__res_u64(IDX_TX_TIME) - state_ts->cc_tx)=
;
> +       state->cc_rx +=3D (u32)(__res_u64(IDX_RX_TIME) - state_ts->cc_rx)=
;
> +out:
> +       state_ts->cc_busy =3D __res_u64(IDX_BUSY_TIME);
> +       state_ts->cc_tx =3D __res_u64(IDX_TX_TIME);
> +       state_ts->cc_rx =3D __res_u64(IDX_RX_TIME);
> +#undef __res_u64
> +
> +       dev_kfree_skb(skb);
> +
> +       return 0;
> +}
> +
>  static void
>  mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.h
> index 11f9eac13ffc..f3e892dbb74c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> @@ -57,6 +57,23 @@ struct mt7925_mcu_reg_event {
>         __le32 val;
>  } __packed;
>
> +enum {
> +       UNI_CMD_MIB_DATA,
> +};
> +
> +enum {
> +       UNI_MIB_BUSY_TIME =3D 19,
> +       UNI_MIB_RX_TIME =3D 20,
> +       UNI_MIB_TX_TIME =3D 28,
> +};
> +
> +struct mt7925_mcu_mib {
> +       __le16 tag;
> +       __le16 len;
> +       __le32 offs;
> +       __le64 data;
> +} __packed;
> +
>  struct mt7925_mcu_ant_id_config {
>         u8 ant_id[4];
>  } __packed;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers=
/net/wireless/mediatek/mt76/mt7925/mt7925.h
> index 636efe038392..b9083e5892f6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> @@ -375,6 +375,9 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, st=
ruct ieee80211_vif *vif,
>  int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
>                               struct ieee80211_chanctx_conf *ctx);
>  int mt7925_mcu_get_temperature(struct mt792x_phy *phy);
> +int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool a=
dd);
> +int mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset);
> +void mt7925_update_channel(struct mt76_phy *mphy);
>
>  int mt7925_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr=
,
>                                    enum mt76_txq_id qid, struct mt76_wcid=
 *wcid,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index 0d477dc1086c..939a46c0428b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -604,7 +604,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>                 .sta_add =3D mt7925_mac_sta_add,
>                 .sta_event =3D mt7925_mac_sta_event,
>                 .sta_remove =3D mt7925_mac_sta_remove,
> -               .update_survey =3D mt792x_update_channel,
> +               .update_survey =3D mt7925_update_channel,
>         };
>         static const struct mt792x_hif_ops mt7925_pcie_ops =3D {
>                 .init_reset =3D mt7925e_init_reset,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/usb.c
> index f97f787b2198..2d3bf035fdfc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> @@ -174,7 +174,7 @@ static int mt7925u_probe(struct usb_interface *usb_in=
tf,
>                 .sta_add =3D mt7925_mac_sta_add,
>                 .sta_event =3D mt7925_mac_sta_event,
>                 .sta_remove =3D mt7925_mac_sta_remove,
> -               .update_survey =3D mt792x_update_channel,
> +               .update_survey =3D mt7925_update_channel,
>         };
>         static const struct mt792x_hif_ops hif_ops =3D {
>                 .mcu_init =3D mt7925u_mcu_init,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wi=
reless/mediatek/mt76/mt792x.h
> index a7d71e007da0..b70b9f9e241a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
> @@ -221,6 +221,8 @@ struct mt792x_phy {
>         u32 ampdu_ref;
>
>         struct mt76_mib_stats mib;
> +       struct mt76_channel_state state_ts[2];
> +       unsigned long survey_hold;
>
>         u8 sta_work_count;
>         u8 clc_chan_conf;
>
> base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
> --
> 2.56.1
>

On Sat, Nov 14, 2026, Devin Wittmayer wrote:
> Chris, your readings near 2^64 match the RFC's math at a wrap. v2
> can't go backwards.

You're right. I was wrong on Nov 13: those readings actually came from the
RFC as posted, not with the 32-bit change.

The initramfs here carries the mt76 modules, and installing a DKMS
build doesn't regenerate it. The kernel I booted back on Nov 5th had been
installed two days earlier and so its initramfs held my RFC build... and
that's what loaded, not the build with the change on disk. The
srcversions bear it out: the loaded mt7925-common never matched the
32-bit build's file...and I only found it today, when the same thing
happened with v2.

But v2 is now loaded here, on the A9000 on USB 2.0. I'll send a Tested-by
after a few days of scanning and some long downloads.

Chris

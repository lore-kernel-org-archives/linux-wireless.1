Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156462;
	b=ZStBej+v/4llFu//D+h4NRp1dibCdnfmQRw918LGu0UsJSCxngYqvA2cA4tfzmzyACU6
	 UQp+2Q3g9219kX4FyqNZyeSG1sHSd4TNgOiM6oFwVf6td46bW7wTQ/xXQIs9cmBw51586
	 7/jnWtMJSR3VGzKsPo80ixggysCIK3G6586hdxRJQvNxFxd866kWF3PJKRw3USlEeq1oS
	 rnNMwvZNag8b+cSMFphdj9tguToqV6z5w8P8Pm/bozz3tc5bnzzz0JG/pcdhEvFD5R2OZ
	 DgeVXIWA+RB+4uHmM5UZtjrgTiDCWNr5sgC3VssZoqrNqIkGQ07DCuoR+qGOtrsCYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2aD6oUNkXSxT5rZKZT1CyhDcaAMP2VqICQ6JeKfJjak=;
	b=GO1p28Ikpzay8B8A2F3CO7BjwReeOmPgE7mvHtEz2b236InQXDADgXDVG9i5Bv33dt79
	 LF8lrwjJfZw/vCufVey7YELpVzJQU8ODTQPgtHSjIOoHpaF6JMtPV6kbm4IoQQ5BOWiHX
	 BfmQWvNj2yJVz2w7ipyuw/l23oF8HCUyB2RzAV0K8YESJgCehNx141wFRWo6od9i+YLTi
	 ym7YWPMix/Y32OcpPWx1iSXTkvirKd6Y71mSZRHh02W6OVLndCanckkaDzIY3J62xyD2f
	 AHYQxh4FyD3nU6q8ofClWr555xtKhLmPQu5rx0cdB0Qzs9w344yAHaNX8vR7oBD/BaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aj7ON6pp;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A850606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 16:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A850606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aj7ON6pp
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so1611615e9.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156460; x=1794761260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2aD6oUNkXSxT5rZKZT1CyhDcaAMP2VqICQ6JeKfJjak=;
        b=Aj7ON6pp1phddKG+HW9O6TiSAv7R3pVgY8nSpsc+Uq/PQp+UUqO/cFXJveY7tFV9li
         ePjLVov/dRldpRHCQNxfJ/5xwi7JwI/GhjQGn7dQiUgtPuNVvaO/rKQpt8vxcRx9AfET
         wTYKHs6XyXrMS4LtNnXbPbJeKETDSqRLtvVaChUl0EBxgXZMqqUBrEPXWvTnR10ikjhE
         TYEZeZB1IU6ocQj1N/FubV7keDbokEKPjVNTuGhtWNJh6jombNl2qfKeH1HgTxBgXVhi
         cw+V5HtiEj8FYRvrKlEtM5LwfkycpIFOVJIOgxI+o7f1Rcg/zHu94HDdChXF4ss74DrF
         ZXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156460; x=1794761260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aD6oUNkXSxT5rZKZT1CyhDcaAMP2VqICQ6JeKfJjak=;
        b=LyA/f1HbjY80KyA4mKi96DFmKkQRNHIyaHrFn1l8xcS/IiMWLtMWBLFnPOUrhSMu2a
         30uusJ+mf1DdhGHIijRbrW7En981Zhm0CmXUpRuQuBi+m1cpCZPCt0BELWfmqFXtKW11
         f0kI25ORCY7nj4biwcaovzvBeeSQzd4V4UTf4PMPd8be9xlY4EezklRc90KO2fhPfADE
         /QVenBk9M9/X64EhwbR0Ks02CnEkjpx8Ewz5s4yMd3dK+d9f0CcMSBd5wx79cSfGO7WT
         haq2H4APUhsLIQSokEmpp4QzAjTZWSKvPLp23Yy3xmZg9il9JpjosuY6Nc1x4QYFrzas
         5vQg==
X-Forwarded-Encrypted: i=1; AL+hErG46zVt2w+dfVTCRaLAimK55+nnTDx1sqmBQ+PZoAGJc9yuBiquryt1qFE+3WQp2jwKbC9xAn+WJ1W/TYiQow==@vger.kernel.org
X-Gm-Message-State: APuU4Z9eOXw6P8GSaRHlj/4M0HsNtl16iDS9EAsLWWLomuC8nrktYVgk
	rGVEP+45SMjZDzf5Iwvel5NF5dD5HF0Lck5eb6eqAKmkazoGHXH3klKx
X-Gm-Gg: AYBFou0JaHzAXLc2WEcPnIHncTm26whTAVdkifZHmeRiGr29IhspAwgT9ZNwNDy7sJC
	0mCb/7DtKXtdhpN5i/9R4m+kUKWcvpJJCs/b3VrfwBj+NzP5kZac9K0GrsD8Lekrb22if4D/7H2
	cAJemNQ/0WmU+DmMcfU9cYTONfpG3xhI2OsvQ+qAUlNO4rCEf2P01ObkHe5c9OO4EF3S3L1+Q99
	dj2ss5Dmmg+dE2wZ54HTQpPmMSI7MCn4yLBamuNnVx4vFJ4XWvaIKaXhbsXDvTYq5mypaCycOi3
	jJYVA107l2Oi0yBwuoKoHES3ekBCVy/m0+iOq9dDnbqh7CWMcT+EfbWyKQccs/+uE6M2olU8XD9
	cU574QQepNCX3H7GWeUjhXGpxLYn1s+4B650qY4w3m3ZNumqk/QriibB5lF0XpSTEGAoxwDT14K
	5pCrj1wlIGVJhSjRi8gpkDY3XBetJHMJWcfEwA3c+KaIERPZrzBX5os6GOgP09vYdNyZRUGn2Sm
	s7k7Dk+pcmsrPWX7QR/Z7uQEKUwq8KloJKt5Kbmhk8EG+0zm3cOrZXtlwJ4zi4IwsPebq+wWSQN
	sMP5Cy+XNBUU20RiWMyQWfGaR85YxBqLfsh9
X-Received: by 2002:a05:600c:4e05:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4b963c6d91amr35334555e9.22.1794156459866;
        Sun, 08 Nov 2026 08:47:39 -0800 (PST)
Received: from [192.168.1.50] ([81.196.40.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm111017315e9.4.2026.11.08.08.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 08:47:39 -0800 (PST)
Message-ID: <54efd6a5-36e6-429f-a9a6-5c5b22e2da2d@gmail.com>
Date: Sun, 8 Nov 2026 18:47:37 +0200
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rtw89: Did a8188bb7644f change the behaviour for MLO?
To: Ping-Ke Shih <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <428324ed-59e2-4c7b-ac97-e3e431a17788@gmail.com>
 <a3b3e72ebe7245edbcc632037b385e60@realtek.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <a3b3e72ebe7245edbcc632037b385e60@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2026 03:41, Ping-Ke Shih wrote:
> Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
>> a8188bb7644f ("wifi: mac80211: change public RX API to use link stations")
>> does this:
>>
>> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
>> index 397ebbfcac09af..454d876aeb8861 100644
>> --- a/drivers/net/wireless/realtek/rtw89/core.c
>> +++ b/drivers/net/wireless/realtek/rtw89/core.c
>> @@ -3073,10 +3073,8 @@ static void rtw89_vif_rx_stats_iter(void *data, u8 *mac,
>>         struct rtw89_vif *rtwvif = vif_to_rtwvif(vif);
>>         struct rtw89_rx_desc_info *desc_info = iter_data->desc_info;
>>         struct sk_buff *skb = iter_data->skb;
>> -       struct ieee80211_rx_status *rx_status = IEEE80211_SKB_RXCB(skb);
>>         struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
>>         struct rtw89_rx_phy_ppdu *phy_ppdu = iter_data->phy_ppdu;
>> -       bool is_mld = ieee80211_vif_is_mld(vif);
>>         struct ieee80211_bss_conf *bss_conf;
>>         struct rtw89_vif_link *rtwvif_link;
>>         const u8 *bssid = iter_data->bssid;
>> @@ -3110,11 +3108,6 @@ static void rtw89_vif_rx_stats_iter(void *data, u8 *mac,
>>         if (!ether_addr_equal(target_bssid, bssid))
>>                 goto out;
>>
>> -       if (is_mld) {
>> -               rx_status->link_valid = true;
>> -               rx_status->link_id = rtwvif_link->link_id;
>> -       }
>> -
>>         bb = rtw89_get_bb_ctx(rtwdev, rtwvif_link->phy_idx);
>>         pkt_stat = &bb->cur_pkt_stat;
>>
>> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
>> index 7bb4618065b672..cba7cdf61ce8a5 100644
>> --- a/include/net/mac80211.h
>> +++ b/include/net/mac80211.h
>> @@ -5389,14 +5389,18 @@ void ieee80211_restart_hw(struct ieee80211_hw *hw);
>>   * mixed for a single hardware. Must not run concurrently with
>>   * ieee80211_tx_status_skb() or ieee80211_tx_status_ni().
>>   *
>> + * For data frames, when hardware has done address translation, a link station
>> + * has to be provided and the frequency information may be skipped.
>> + *
>>   * This function must be called with BHs disabled and RCU read lock
>>   *
>>   * @hw: the hardware this frame came in on
>> - * @sta: the station the frame was received from, or %NULL
>> + * @link_sta: the link station the data frame was received from, or %NULL
>>   * @skb: the buffer to receive, owned by mac80211 after this call
>>   * @list: the destination list
>>   */
>> -void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
>> +void ieee80211_rx_list(struct ieee80211_hw *hw,
>> +                      struct ieee80211_link_sta *link_sta,
>>                        struct sk_buff *skb, struct list_head *list);
>>
>>  /**
>> @@ -5414,14 +5418,18 @@ void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
>>   * mixed for a single hardware. Must not run concurrently with
>>   * ieee80211_tx_status_skb() or ieee80211_tx_status_ni().
>>   *
>> + * For data frames, when hardware has done address translation, a link station
>> + * has to be provided and the frequency information may be skipped.
>> + *
>>   * This function must be called with BHs disabled.
>>   *
>>   * @hw: the hardware this frame came in on
>> - * @sta: the station the frame was received from, or %NULL
>> + * @link_sta: the link station the data frame was received from, or %NULL
>>   * @skb: the buffer to receive, owned by mac80211 after this call
>>   * @napi: the NAPI context
>>   */
>> -void ieee80211_rx_napi(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
>> +void ieee80211_rx_napi(struct ieee80211_hw *hw,
>> +                      struct ieee80211_link_sta *link_sta,
>>                        struct sk_buff *skb, struct napi_struct *napi);
>>
>>  /**
>> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
>> index 31dc6f83781b1d..0ddd0b8ea12a05 100644
>> --- a/net/mac80211/rx.c
>> +++ b/net/mac80211/rx.c
>> @@ -5556,7 +5556,8 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
>>   * This is the receive path handler. It is called by a low level driver when an
>>   * 802.11 MPDU is received from the hardware.
>>   */
>> -void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
>> +void ieee80211_rx_list(struct ieee80211_hw *hw,
>> +                      struct ieee80211_link_sta *link_pubsta,
>>                        struct sk_buff *skb, struct list_head *list)
>>  {
>>         struct ieee80211_local *local = hw_to_local(hw);
>> @@ -5564,6 +5565,7 @@ void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
>>         struct ieee80211_supported_band *sband;
>>         struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
>>         struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
>> +       struct ieee80211_sta *pubsta;
>>
>>         WARN_ON_ONCE(softirq_count() == 0);
>>
>> @@ -5694,8 +5696,15 @@ void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
>>                 }
>>         }
>>
>> -       if (WARN_ON_ONCE(status->link_id >= IEEE80211_LINK_UNSPECIFIED))
>> -               goto drop;
>> +       /* FIXME: Emulate the old driver behaviour for now */
>> +       if (link_pubsta) {
>> +               status->link_valid = 1;
>> +               status->link_id = link_pubsta->link_id;
>> +               pubsta = link_pubsta->sta;
>> +       } else {
>> +               status->link_valid = 0;
>> +               pubsta = NULL;
>> +       }
>>
>>         status->rx_flags = 0;
>>
>> @@ -5727,7 +5736,8 @@ void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
>>  }
>>  EXPORT_SYMBOL(ieee80211_rx_list);
>>
>> -void ieee80211_rx_napi(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
>> +void ieee80211_rx_napi(struct ieee80211_hw *hw,
>> +                      struct ieee80211_link_sta *link_pubsta,
>>                        struct sk_buff *skb, struct napi_struct *napi)
>>  {
>>         struct sk_buff *tmp;
>> @@ -5740,7 +5750,7 @@ void ieee80211_rx_napi(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
>>          * receive processing
>>          */
>>         rcu_read_lock();
>> -       ieee80211_rx_list(hw, pubsta, skb, &list);
>> +       ieee80211_rx_list(hw, link_pubsta, skb, &list);
>>         rcu_read_unlock();
>>
>>         if (!napi) {
>>
>> rtw89_core_rx_to_mac80211() calls ieee80211_rx_napi() with link_sta = NULL,
>> so it's not getting the emulated old behaviour in ieee80211_rx_list().
>>
>> Is this something that needs fixing?
> 
> By the comment of link_id field in struct ieee80211_rx_status:
> 
>  * @link_id: id of the link used to receive the packet. Set and used by
>  *	mac80211 internally, it uses @freq set by the driver to identify the
>  *	correct link per vif.
> 
> rtw89 can report proper freq to get link_id back. We tested 7.4-rc and
> things are expected. Did you encounter problems?

No problems here. I can't test MLO, actually. I just noticed this change
while importing the latest patches [1] and thought to ask.

[1] https://github.com/morrownr/rtw89

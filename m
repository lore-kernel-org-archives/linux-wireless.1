Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.84.6.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807629;
	b=33B5ipp4hm94KvQlPcRy1VMZSpF4qQW6S7k4feTTHXRCFa/VKiqmjhk0NWfIrV5G+h5s
	 MjyKH+sgOiEpxRaee3HmY2qLRYeD5PoKhjOms143a2r/ihHbvQqNiO6jTPyI5gGBmwqX1
	 xIctKmabkcpQPhNK+B672l/HassfgKNVphEmjVp02Snq90IbCFUsBbVchu0p48u3BQfOk
	 I2Mu2NsQcXt6GUSX/p5s8lzqK7BKgh6uH09DKxzIjpGMsmzs/sVFP3u3lg8Dwj3zCchgY
	 9cz846KZhBmpNM8aEQxXjTmYL4JKHs6N/F4qgEVGGDQBTVxJBGvgyCnVtzJlV4drMzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807629;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:Received-SPF:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned:X-NMN-MailScanner-Information:
	 X-NMN-MailScanner-ID:X-NMN-MailScanner:X-NMN-MailScanner-From:
	 X-Spam-Status:X-Received;
	bh=Gb9g/0+39yzx0iXkhS8fgcxSDQqjH0jfPE2h2OD8zKQ=;
	b=xb+MzhQVPYwxsKL9dCsaA7d0kG5C8r9viKigxC3xcfOcFVNFf6SqbcP9wrz8LFU2M9/T
	 xspzruVSbaP4X4yF4mkvnpmMLCxdQVBlyxuPO+VFhDLeNvvPJxyjylsuft3K3h13yCopn
	 Mb7W1JJhOCzTBYxWworx3lVtGxx8ZhScXDKz1gwkB2d0ZCCaUTSJWfBdujMEkObkypd1v
	 Mwb492B5ZwPoVzUAm5OrCL+M6nAkgocNYbthydyPb39xvByDdaLzW0aLIMVAAbKgJCw/H
	 jG3w/d/aOGJPFtZIMFNcMcvd9HCszhi5wzDfNZ0fh+aPXXFvYXYaYeIsFCaN0TrZS4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dd-wrt.com;
	spf=pass smtp.mailfrom=dd-wrt.com;
	dkim=pass header.d=dd-wrt.com header.i=@dd-wrt.com header.a=rsa-sha256 header.s=mikd header.b=fCqYUmUn;
	arc=none smtp.remote-ip=185.84.6.188
Received: from mail.as201155.net (mail.as201155.net [185.84.6.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE651606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE651606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dd-wrt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dd-wrt.com header.i=@dd-wrt.com header.a=rsa-sha256 header.s=mikd header.b=fCqYUmUn
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de [IPv6:2a05:a1c0:0:de::167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.as201155.net (Postfix) with ESMTPS id EEB81DFC49
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID; bh=Gb9g/0+39yzx0iXkhS8fgcxSDQqjH0jfPE2h2OD8zKQ=;
	b=fCqYUmUnaqHtBAfky2DsmuCIjStL3DXysNTTkpYtDkMas3l1YiPOCwLEK0mGh+PmbkUkSvBIjC8CsVWZ3baK0ygSuK1CO7esQHNF3/hUZ0XtCuFbJQc3mVnpNP7btwCCwruVNEPQJcfRhSTNAe8DEuVQYkhnuZqUyt77cBaY2Y0=;
Message-ID: <6f6d6233-f798-49fc-a428-b4c9f0bba102@dd-wrt.com>
Date: Mon, 16 Nov 2026 06:40:18 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface
 bringup
To: linux-wireless@vger.kernel.org
References: <20261116015955.564420-1-repaxan@gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <20261116015955.564420-1-repaxan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1xSpRz-000B88-O8
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received:  from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1xSpRz-000B88-O8
	for linux-wireless@vger.kernel.org; Mon, 16 Nov 2026 06:40:19 +0100


Am 16.11.2026 um 02:59 schrieb Ronald Ouyang:
> I tried the WDS support added in https://lore.kernel.org/linux-wireless/20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com/.
> With a ath12k WDS client, the frames received by the WDS AP had some extra bytes in the beginning of the frame.
>
> My understanding of the problem:
> 1 - this is a WDS client, 4 address mode.
> 2 - on interface bringup (ath12k_mac_op_add_interface), it has OFFLOAD_ENCAP_ENABLED but not OFFLOAD_ENCAP_4ADDR.
>      it picks software encap for this interface and it doesn't get rechecked later.
>      so later on, it software encaps the ethernet frames and sends the resulting wifi frames to the vdev
> 3 - on vdev bringup (ath12k_mac_vdev_create -> ath12k_mac_update_vif_offload), it has OFFLOAD_ENCAP_ENABLED.
>      so it expects to receive ethernet or "native wifi" frames.
>      it also sets OFFLOAD_ENCAP_4ADDR but it's too late here
> 4 - the wifi frame encapsulated according to (2) gets passed to the vdev marked as "native wifi".
>      it already had a QOS field in it, the vdev adds an extra one when doing the hardware encap
>
> This fixes it by setting OFFLOAD_ENCAP_4ADDR during interface bringup.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")
>
> Signed-off-by: Ronald Ouyang <repaxan@gmail.com>
> ---
> Changes in v2:
> - add explicit check for station and AP for consistency with ath12k_mac_update_vif_offload()
> - clarify problem description slightly
> - Link to v1: https://lore.kernel.org/linux-wireless/20261111215845.814490-1-repaxan@gmail.com/
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index a247dcf387de..f0936f6c969e 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -10276,7 +10276,8 @@ static void ath12k_mac_update_vif_offload(struct ath12k_link_vif *arvif)
>   	if (ret) {
>   		ath12k_warn(ab, "failed to set vdev %d tx encap mode: %d\n",
>   			    arvif->vdev_id, ret);
> -		vif->offload_flags &= ~IEEE80211_OFFLOAD_ENCAP_ENABLED;
> +		vif->offload_flags &= ~(IEEE80211_OFFLOAD_ENCAP_ENABLED |
> +					IEEE80211_OFFLOAD_ENCAP_4ADDR);
>   	}
>   
>   	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
> @@ -10940,6 +10941,11 @@ int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
>   
>   	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
>   
> +	if ((vif->type == NL80211_IFTYPE_STATION ||
> +	     vif->type == NL80211_IFTYPE_AP) &&
> +	    (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED))
> +		vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
> +

isnt the correct iftype AP_VLAN for AP with 4addr frame support enabled?


Sebastian

>   	ath12k_mac_determine_vdev_type(vif, ahvif);
>   
>   	for_each_ar(ah, ar, i) {

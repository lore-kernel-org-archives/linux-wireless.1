Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516281;
	b=uDOaA/WdPrGGQyDMpPVnbAcsItXXk9u0e5muekIn+SibCZIkvvgAHuSbL+RCZLf/oBYF
	 WSncDeQp7erXNBzG99yNwOPbbeSKWr08oXTKoxjvBzCoiRg7pcxcw5cnRd+frW6mQFaQb
	 tKzhoqa8TN93zyaV3WmL4iK+0jwK+qWE29fp7/8IfwTJrlzt2ZtxtYP11JNnWOUpQsadi
	 I4VhLfRMTLPfjTYIMF4eX6ADkOzA+ETUS5pzrk+XjHn2IZOeap71Qyqlgnn6QC52Wvadz
	 5G28ODL37YiBFMf2FMkPUqcX53hLmOHI5gPOyHAXt7naBIK6mp5G9G/hnReiulXLTmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516281;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=A11G5dHgXmzlpAT1RjhvWuP21qtCGI1WfTZnzFEtO9Q=;
	b=KB/T5w8AiJRN6M+VdxaeZ1pS/7JLMvYMJzetXWZWWloTy5zRwPBX9MVKwds0cPQGxTUf
	 2iD8cMq7wBFtz3SoZUTeg0Flu4WSNNf9JyI8YMnQQ69MsPXzYh5PSjXKGh8DbjMtAYiYX
	 oGoWbQ/LfpbHG52pOzOSe9MjeXwh/yiaF1bCs7g2Fe4eBupNZCZo6zhzwwRelxekvIjrf
	 hDLDMye4TuC/TFBSuiRkF+7x4FXgpoVhRGwuFAFcog0G8VvNHP5tvXwCdEvvIEHb2Tl5P
	 Jr0Hp88/xEYudXRPQxExoFsgTbxK3MLAMAF+UFDT1sThKBQCQGWwKvRWiZT/LO475XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="XJw/DhRj";
	arc=none smtp.remote-ip=95.215.58.238
Received: from mta1.migadu.com (out-238.mta1.migadu.com [95.215.58.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B45606A32E
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 20:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B45606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XJw/DhRj
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QROOg6Bv3DuPUj2HzbiUd3GrFJJf8OCVbWr6j69/qKI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794516278; v=1; x=1795121078;
 b=XJw/DhRjbocd3d8PDVJ2rKNFRGYI7802RoTdXtysi+sVHiYybzs7pUt5r5ALglfbdLWNDmGM
 EVLhGaAQ9T1w+egaGHibCm8f04mjrgDeFUXHrYqMzwMEItRXEXo7W0vkThrJBOn9K4zZxhGsERu
 mZW7bUyq+PPM6tyJ2lLc2TFc=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 774fdbfdb205653c;
	Thu, 12 Nov 2026 20:44:37 +0000
X-Mizu-Trace-ID: 774fdbfdb205653c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 21:44:36 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 =?ISO-8859-1?Q?Pablo_Mart=EDnez_R=EDos?= <pabloriosmartinez@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_rtw88=3A_RTL8822BE_=2810ec=3Ab822=29_n?=
 =?US-ASCII?Q?ever_authenticates_on_5_GHz_with_a_?=
 =?US-ASCII?Q?Huawei_router=3B_poor_2=2E4_GHz_link=3B_?=
 =?US-ASCII?Q?same_hardware_works_fine_on_Windows?=
In-Reply-To: <8f5486b8-9bcd-4c6c-b0ab-500bb80ebf00@gmail.com>
References: <CALTviDkEWERPrtc51WFB1K3Sn7wLdt6YhB=_Ck4PwBPdLcojBQ@mail.gmail.com> <2c8319def838488cb8a3e4d5dc44f357@realtek.com> <7d68ebe2-d24e-4c07-9b49-7f76551a12bb@gmail.com> <CALTviDn=ypR2HCjVxu7U-5RDRU002YNxCbPqeH7a+5LTNxCNbg@mail.gmail.com> <36da0b32-9f97-4e82-a06e-53dcd42125dd@gmail.com> <CALTviDksF1-AoDXUDpyH0eQLbtrMBJ+DsnSuKGm=3W1E3q_O7w@mail.gmail.com> <8f5486b8-9bcd-4c6c-b0ab-500bb80ebf00@gmail.com>
Message-ID: <3E4C2E08-4DB8-4017-954D-C2412CEB171A@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Pablo and Bitterblue,

On November 12, 2026 4:50:55 PM GMT+01:00, Bitterblue Smith
<rtl8821cerfe2@gmail.com> wrote:
>On 11/11/2026 23:00, Pablo Martínez Ríos wrote:
>>
>> What would you like me to try next?
>
> I don't have other ideas.

I had a look and I think this could be EDCCA. With the country set to ES,
rtw88 runs the ETSI adaptivity mode. The RTL8822B firmware doesn't do that
part itself, so the driver sets the energy detect threshold in
rtw8822b_adaptivity():

        l2h = min_t(s8, igi, dm_info->l2h_th_ini);
        h2l = l2h - EDCCA_L2H_H2L_DIFF;

l2h_th_ini is 36 for ETSI, so the threshold follows IGI down. Before the
association rtw88 has no station entry yet, so the DIG lets IGI drop to
its 0x1c floor. That gives L2H 28 and H2L 21, nominally -82 and -89 dBm.
As long as the energy on the channel stays above that, the MAC holds every
frame, so the authentication frames may never leave the card.

As far as I can see that fits most of what you measured. On 40 and 80 MHz
the receiver takes in the whole channel, so it likely sees more noise and
more traffic from other networks than on 20 MHz. That would explain why
the AP only ACKed your injected frames on 20 MHz.

Once associated, the DIG raises IGI at a much lower false alarm count, so
the threshold can sit higher. That may be why the link survived the walk
upstairs. To leave LPS the firmware also needs a null frame ACKed by the
AP, so the "firmware failed to leave lps state" messages could come from
the same thing.

Your kernels use the same rule on 2.4 GHz, which might explain the bad
times of day there as well. Josef already relaxed it for 2.4 GHz in
rtw-next with commit b0435910e47d.

The one result that doesn't fit is 00. With 00 the driver uses the normal
threshold, which never goes below 48 (nominally -62 dBm), so I would
expect 00 to work from upstairs. Could you check "iw reg get" right before
you connect, once with 00 and once with ES? After a connection the country
element of your router can switch it to ES.

Could you also try the patch below with ES set? On 5 GHz it uses a fixed
L2H of 45, nominally -65 dBm, which is 3 dB below the EN 301 893 level
over 20 MHz. It also carries Josef's 2.4 GHz change, so it should apply to
your 6.12 sources. If it helps, I will send it properly for rtw-next.

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.c b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
--- a/drivers/net/wireless/realtek/rtw88/rtw8822b.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
@@ -1565,6 +1565,16 @@ static void rtw8822b_adaptivity(struct rtw_dev *rtwdev)
        if (dm_info->edcca_mode == RTW_EDCCA_NORMAL) {
                l2h = max_t(s8, igi + EDCCA_IGI_L2H_DIFF, EDCCA_TH_L2H_LB);
                h2l = l2h - EDCCA_L2H_H2L_DIFF_NORMAL;
+       } else if (rtwdev->regd.dfs_region == NL80211_DFS_ETSI &&
+                  rtwdev->hal.current_band_type == RTW_BAND_2G) {
+               /* follow the normal threshold, capped for EN 300 328 */
+               l2h = max_t(s8, igi + EDCCA_IGI_L2H_DIFF, EDCCA_TH_L2H_LB);
+               l2h = min_t(s8, l2h, RTW8822B_EDCCA_ETSI_2G);
+               h2l = l2h - EDCCA_L2H_H2L_DIFF;
+       } else if (rtwdev->regd.dfs_region == NL80211_DFS_ETSI &&
+                  rtwdev->hal.current_band_type == RTW_BAND_5G) {
+               l2h = RTW8822B_EDCCA_ETSI_5G;
+               h2l = l2h - EDCCA_L2H_H2L_DIFF;
        } else {
                l2h = min_t(s8, igi, dm_info->l2h_th_ini);
                h2l = l2h - EDCCA_L2H_H2L_DIFF;
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.h b/drivers/net/wireless/realtek/rtw88/rtw8822b.h
--- a/drivers/net/wireless/realtek/rtw88/rtw8822b.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.h
@@ -149,6 +149,10 @@ _rtw_write32s_mask(struct rtw_dev *rtwdev, u32 addr, u32 mask, u32 data)
 #define GET_PHY_STAT_P1_RXSNR_B(phy_stat)                                      \
        le32_get_bits(*((__le32 *)(phy_stat) + 0x06), GENMASK(15, 8))

+/* nominally -60 dBm: 3 dB below the EN 300 328 level at 20 dBm e.i.r.p. */
+#define RTW8822B_EDCCA_ETSI_2G 50
+/* nominally -65 dBm: 3 dB below the EN 301 893 level over 20 MHz */
+#define RTW8822B_EDCCA_ETSI_5G 45
 #define RTW8822B_EDCCA_MAX     0x7f
 #define RTW8822B_EDCCA_SRC_DEF 1
 #define REG_HTSTFWT    0x800

Best regards,
Luka Gejak

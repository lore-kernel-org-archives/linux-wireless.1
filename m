Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106601;
	b=jqSbfhPjGDzC3ona5h/IN5PnwkBFlgklxZPL2Xz0aKHE3FyCwO0VF/GF4dlSuOwj+Foi
	 BmRGKBsL4r6WSJ1P4D+mBupYLKHlNh9o+hm5BdthrxXuefwXT0CUrcckcvE0Wpa4Vfg7m
	 G9Jje/7U7XQ8zEAos3BA37RgTT42cb++1pEZ6xwrpGCcgCkHv0xhiOUaTa2L+ZLU/Wbq6
	 YpG/tQ79VB4L9idxUTHj9bi8KswMKtR5hDLCoLEBCoGvECaXNDlwamR7iVB+iQsRHqtks
	 LAcNUuVuc+XKQ7bSC9RyJNkkw1QLlc4qTKBIu6irDRlHlC/vwLJRdJD325x/31HvmjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106601;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=NZMCO3ZROzVkmnGEUVdWn2AxWlOo3ZPfzmOLWIFSHbQ=;
	b=HHuA/s0Yx34IQJhk9yq0hE9p7W7XZdsCEXi1MY7ola93ajz8Eydu7kpMHUR65wX6wLcH
	 FAm34kS3vv3wN/oCk2lDBH+uu2iNswt650cnwzoBVoLeRRnwd7U/XNaV0542X8JIpz/0a
	 QKbQNu2ixko5bdcBRrPNYbri4OMdkh0Cbb4fpwk6dmDqXpfUTK/99VAo6pgXg44To0PxE
	 6LCgB8LWKL236rJvyTOn6HGLGU0y7bNxdWouEYdk6Ynz8VmdvWltjrrOqpKEOYgC8/d9k
	 9zdqgOGEawGrpnzwBvf1BqVPAUPPZzPdEyZWeRpEK3LLhOmQE3r5knK4u3DsoDBUpsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=QkdKZm6w;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20139606A31A
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 02:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20139606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=QkdKZm6w
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A82uN9i93105088, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794106584; bh=NZMCO3ZROzVkmnGEUVdWn2AxWlOo3ZPfzmOLWIFSHbQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=QkdKZm6wFyUEd9LzTMGj1f1qaYC8KJ1reOxXTGjdEjbM32ESTsIqbzlxeOHL2rvfY
	 DJnl65xBzK1I6xe8rt9txM9cRzuLIdOwiTCj7JUlQUSFSJoVFXiqPVqp9JU5M7q8RD
	 vSmeEiPrN3ffoKUWFe44Wb9EQoJqNnv1eUcHETRKbDj68MdR8QJAdDMaVsujGH3oPw
	 h0cUs0Sk9SiK8OUPDuDFdrpvw2jfZIWcgrrtke4zhT2mDZFxB4fmbGs2sd7EicioHe
	 z+Gx/Bmv4btxuwiCnJfyJZcme4pduCn872imdLbYs4PaLbfKN76NodfGBS9KvqIyLc
	 h1qFlw5U1Xjbw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A82uN9i93105088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 10:56:23 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 10:56:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 8 Nov 2026 10:56:24 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Huihui Huang <hhhuang@smu.edu.sg>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Luka Gejak <luka.gejak@linux.dev>
Subject: RE: [PATCH rtw-next v3 2/2] wifi: rtw88: check the C2H payload length
 before reading it
Thread-Topic: [PATCH rtw-next v3 2/2] wifi: rtw88: check the C2H payload
 length before reading it
Thread-Index: AQHdbSXkwrKL8ISdgk+h4vqqjdMzCrcjeI0g
Date: Sun, 8 Nov 2026 02:56:23 +0000
Message-ID: <bdb47a1dc13347448cff24a26a231478@realtek.com>
References: <20261105125958.3891196-1-hhhuang@smu.edu.sg>
 <20261105125958.3891196-3-hhhuang@smu.edu.sg>
In-Reply-To: <20261105125958.3891196-3-hhhuang@smu.edu.sg>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Huihui Huang <hhhuang@smu.edu.sg> wrote:
> With the previous patch, a C2H packet holds at least the 2-byte C2H
> header, but its payload can still be shorter than what the handlers
> read.=20

If you want to describe "previous patch", say it in cover-letter. Just
describe what you do in this patch.

> These handlers read fixed payload offsets without checking the
> payload length:
>=20
>  - rtw_fw_scan_result() reads payload[0];
>  - rtw_coex_info_response() reads payload[0];
>  - rtw_fw_c2h_cmd_handle_ext() reads the sub-command ID in payload[0],
>    and rtw_hw_scan_status_report() and rtw_hw_scan_chan_switch() read
>    up to payload[2] and payload[4];
>  - rtw_tx_report_handle() reads up to payload[6] for C2H_CCX_TX_RPT and
>    payload[9] for C2H_CCX_RPT.

You should think how to summarize these in subject...=20

>=20
> With a short payload, these reads are beyond skb->len.
>=20
> Add rtw_c2h_payload_len() to get the payload length of a C2H skb, and
> ignore C2H packets whose payload is too short for the fields the
> handler reads. For C2H_SCAN_RESULT, check the length before completing
> fw_scan_density, so that a report without payload does not wake the
> waiter. A short HW scan status report is not ignored but completes the
> scan as aborted; otherwise the scan stays pending until something
> aborts it.
>=20
> For coexistence responses, this only validates the byte inspected by
> rtw_coex_info_response(). Length validation for the queued response's
> GET_COEX_RESP_*() consumers is left for a separate follow-up.

The detail of what the patch does isn't so useful for reviewers. LLM can
help to generate many stuffs (but not helpful). Please remove unnecessary
part. Reading long long commit message spends a lot of time.

>=20
> Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> Fixes: 4136214f7c46 ("rtw88: add BT co-existence support")
> Fixes: a853d234e179 ("rtw88: notify fw when driver in scan-period to avoi=
d potential problem")
> Fixes: 10d162b2ed39 ("rtw88: 8822c: add ieee80211_ops::hw_scan")

Should we need these Fixes? I think the changes of this patch should not
happen.=20

> Suggested-by: Luka Gejak <luka.gejak@linux.dev>
> Assisted-by: LLM

No this tag now.

> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> ---
>  drivers/net/wireless/realtek/rtw88/coex.c |  3 ++-
>  drivers/net/wireless/realtek/rtw88/fw.c   | 17 +++++++++++++++--
>  drivers/net/wireless/realtek/rtw88/fw.h   |  8 ++++++++
>  drivers/net/wireless/realtek/rtw88/tx.c   |  3 +++
>  4 files changed, 28 insertions(+), 3 deletions(-)
>=20
> v3: complete the HW scan as aborted on a short scan status report
>     instead of ignoring it (Luka).
> v2: new patch (Luka).
>=20
> Tested on rtw-next on top of patch 1 with a temporary KUnit test (UML).
> C2H packets with the 2-byte header and 0 or 1 payload byte are passed
> to rtw_fw_c2h_cmd_rx_irqsafe(); the byte after the header is set to a
> value the handler would act on. Verbatim KUnit output:
>=20
>   before this change:
>     # rtw_c2h_scan_result_no_payload_test: payload_len=3D0 scan_density=
=3D0xab completed=3D1 (want 0x00, 0)
>     not ok 1 rtw_c2h_scan_result_no_payload_test
>     # rtw_c2h_scan_result_one_byte_test: payload_len=3D1 scan_density=3D0=
xab completed=3D1 (want 0xab, 1)
>     ok 2 rtw_c2h_scan_result_one_byte_test
>     # rtw_c2h_coex_resp_no_payload_test: payload_len=3D0 coex queue len=
=3D1 (want 0)
>     not ok 3 rtw_c2h_coex_resp_no_payload_test
>     # rtw_c2h_coex_resp_one_byte_test: payload_len=3D1 coex queue len=3D1=
 (want 1)
>     ok 4 rtw_c2h_coex_resp_one_byte_test
>   after this change:
>     # rtw_c2h_scan_result_no_payload_test: payload_len=3D0 scan_density=
=3D0x00 completed=3D0 (want 0x00, 0)
>     ok 1 rtw_c2h_scan_result_no_payload_test
>     # rtw_c2h_scan_result_one_byte_test: payload_len=3D1 scan_density=3D0=
xab completed=3D1 (want 0xab, 1)
>     ok 2 rtw_c2h_scan_result_one_byte_test
>     # rtw_c2h_coex_resp_no_payload_test: payload_len=3D0 coex queue len=
=3D0 (want 0)
>     ok 3 rtw_c2h_coex_resp_no_payload_test
>     # rtw_c2h_coex_resp_one_byte_test: payload_len=3D1 coex queue len=3D1=
 (want 1)
>     ok 4 rtw_c2h_coex_resp_one_byte_test
>=20
> The HALMAC paths, including the HW scan status report change in v3,
> and the TX report path were only compile-tested. Not tested on real
> hardware.
>=20
> diff --git a/drivers/net/wireless/realtek/rtw88/coex.c b/drivers/net/wire=
less/realtek/rtw88/coex.c
> index 37c336def419..e2c91efc529d 100644
> --- a/drivers/net/wireless/realtek/rtw88/coex.c
> +++ b/drivers/net/wireless/realtek/rtw88/coex.c
> @@ -643,7 +643,8 @@ void rtw_coex_info_response(struct rtw_dev *rtwdev, s=
truct sk_buff *skb)
>         struct rtw_coex *coex =3D &rtwdev->coex;
>         u8 *payload =3D get_payload_from_coex_resp(skb);
>=20
> -       if (payload[0] !=3D COEX_RESP_ACK_BY_WL_FW) {
> +       if (rtw_c2h_payload_len(skb) < 1 ||
> +           payload[0] !=3D COEX_RESP_ACK_BY_WL_FW) {
>                 dev_kfree_skb_any(skb);
>                 return;
>         }
> diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wirele=
ss/realtek/rtw88/fw.c
> index 0a909bf79cf5..18d3689054e6 100644
> --- a/drivers/net/wireless/realtek/rtw88/fw.c
> +++ b/drivers/net/wireless/realtek/rtw88/fw.c
> @@ -96,6 +96,9 @@ static void rtw_fw_c2h_cmd_handle_ext(struct rtw_dev *r=
twdev,
>         struct rtw_c2h_cmd *c2h;
>         u8 sub_cmd_id;
>=20
> +       if (rtw_c2h_payload_len(skb) < 1)
> +               return;
> +
>         c2h =3D get_c2h_from_skb(skb);
>         sub_cmd_id =3D c2h->payload[0];
>=20
> @@ -376,8 +379,10 @@ void rtw_fw_c2h_cmd_rx_irqsafe(struct rtw_dev *rtwde=
v, u32 pkt_offset,
>                 dev_kfree_skb_any(skb);
>                 break;
>         case C2H_SCAN_RESULT:
> -               complete(&rtwdev->fw_scan_density);
> -               rtw_fw_scan_result(rtwdev, c2h->payload, len);
> +               if (len) {

If the c2h->id is SCAN already, validate 'len' in rtw_fw_scan_result().

I don't want to add condition which I think no possible happen.

> +                       complete(&rtwdev->fw_scan_density);
> +                       rtw_fw_scan_result(rtwdev, c2h->payload, len);
> +               }
>                 dev_kfree_skb_any(skb);
>                 break;
>         default:
> @@ -2381,6 +2386,11 @@ void rtw_hw_scan_status_report(struct rtw_dev *rtw=
dev, struct sk_buff *skb)
>         if (!test_bit(RTW_FLAG_SCANNING, rtwdev->flags))
>                 return;
>=20
> +       if (rtw_c2h_payload_len(skb) < 3) {

The 3 is because of GET_SCAN_REPORT_RETURN_CODE(). How does people understa=
nd
what 3 means?

Maybe, we should define specific struct for status_report, like

struct status_report {
	u8 id;
	u8 seq;=20
	u8 rsvd[2]
	u8 retrun_code;
};

struct status_report *status_report =3D get_c2h_from_skb(skb);

if (rtw_c2h_payload_len(skb) < sizeof(*status_report))


> +               rtw_hw_scan_complete(rtwdev, vif, true);
> +               return;
> +       }
> +
>         c2h =3D get_c2h_from_skb(skb);
>         rc =3D GET_SCAN_REPORT_RETURN_CODE(c2h->payload);
>         aborted =3D rc !=3D RTW_SCAN_REPORT_SUCCESS;
> @@ -2436,6 +2446,9 @@ void rtw_hw_scan_chan_switch(struct rtw_dev *rtwdev=
, struct sk_buff *skb)
>         if (!test_bit(RTW_FLAG_SCANNING, rtwdev->flags))
>                 return;
>=20
> +       if (rtw_c2h_payload_len(skb) < 5)

ditto. This is ever harder to know why here is 5...=20

> +               return;
> +
>         c2h =3D get_c2h_from_skb(skb);
>         chan =3D GET_CHAN_SWITCH_CENTRAL_CH(c2h->payload);
>         id =3D GET_CHAN_SWITCH_ID(c2h->payload);
> diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wirele=
ss/realtek/rtw88/fw.h
> index 48ad9ceab6ea..6713dfac8c94 100644
> --- a/drivers/net/wireless/realtek/rtw88/fw.h
> +++ b/drivers/net/wireless/realtek/rtw88/fw.h
> @@ -810,6 +810,14 @@ static inline struct rtw_c2h_cmd *get_c2h_from_skb(s=
truct sk_buff *skb)
>         return (struct rtw_c2h_cmd *)(skb->data + pkt_offset);
>  }
>=20
> +/* The C2H header has been validated by rtw_fw_c2h_cmd_rx_irqsafe(). */
> +static inline u32 rtw_c2h_payload_len(struct sk_buff *skb)
> +{
> +       u32 pkt_offset =3D *((u32 *)skb->cb);
> +
> +       return skb->len - pkt_offset - sizeof(struct rtw_c2h_cmd);
> +}
> +
>  static inline bool rtw_fw_feature_check(struct rtw_fw_state *fw,
>                                         enum rtw_fw_feature feature)
>  {
> diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wirele=
ss/realtek/rtw88/tx.c
> index 701ed7c4f3f7..ddfddd7cb4db 100644
> --- a/drivers/net/wireless/realtek/rtw88/tx.c
> +++ b/drivers/net/wireless/realtek/rtw88/tx.c
> @@ -241,6 +241,9 @@ void rtw_tx_report_handle(struct rtw_dev *rtwdev, str=
uct sk_buff *skb, int src)
>         u8 sn, st;
>         u8 *n;
>=20
> +       if (rtw_c2h_payload_len(skb) < (src =3D=3D C2H_CCX_TX_RPT ? 7 : 1=
0))

Ditto. 7 and 10.... very hard to understand.=20

> +               return;
> +
>         c2h =3D get_c2h_from_skb(skb);
>=20
>         if (src =3D=3D C2H_CCX_TX_RPT) {
> --
> 2.43.0
>=20

